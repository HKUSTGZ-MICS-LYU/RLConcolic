import os
from Utilies import InputVector, get_params
from pyverilog.vparser.ast import *
from Globals import *

class CreateMultiInputTestBench:
    def __init__(self, ast, top_module, clk_name, reset_name, reset_edge, folder_pth, unroll):
        self.ast = ast
        self.top_module = top_module
        self.clk_name = clk_name
        self.reset_name = reset_name
        self.reset_edge = reset_edge
        self.unroll = unroll

        self.folder_pth = folder_pth if folder_pth.endswith(("/", "\\")) else folder_pth + os.sep
        self.folder_pth = self.folder_pth.replace("\\", "/")

        self.tb_file = os.path.join(self.folder_pth, 'conquest_tb_multi.v').replace("\\", "/")
        self.data_mem_file = None
        self.reset_edge_active = None
        self.reset_edge_inactive = None

        self.inputs_dir = os.path.join(self.folder_pth, "inputs_history").replace("\\", "/")
        self.mem_files = []

    def main(self):
        self._extract_module_info()
        self._collect_mem_files()
        self.create_testbench()

    def _extract_module_info(self):
        self._get_ports_list()
        self._get_variables_list()
        self._get_reset_edge()

    def _get_ports_list(self):
        self.ports_list = {}
        for port in self.ast.description.definitions[0].portlist.ports:
            msb = get_params(port.first.width.msb) if port.first.width else 0
            lsb = get_params(port.first.width.lsb) if port.first.width else 0
            width = msb - lsb + 1
            self.ports_list[port.first.name] = {
                "direction": port.first.__class__.__name__,
                "msb": msb,
                "lsb": lsb,
                "width": width,
                "signed": getattr(port.first, "signed", False),
                "type": port.second.__class__.__name__ if port.second else "wire",
            }

    def _get_variables_list(self):
        self.variables_list = {}
        for item in self.ast.description.definitions[0].items:
            if isinstance(item, Decl):
                obj = item.list[0]
                W_msb = get_params(obj.width.msb) if obj.width else 0
                W_lsb = get_params(obj.width.lsb) if obj.width else 0
                Width = W_msb - W_lsb + 1

                if obj.dimensions:
                    D_msb = get_params(obj.dimensions.lengths[0].msb)
                    D_lsb = get_params(obj.dimensions.lengths[0].lsb)
                    Depth = abs(D_msb - D_lsb) + 1
                else:
                    D_msb, D_lsb, Depth = 0, 0, None

                self.variables_list[obj.name] = {
                    "type": obj.__class__.__name__,
                    "Width": Width,
                    "W_msb": W_msb,
                    "W_lsb": W_lsb,
                    "Depth": Depth,
                    "D_msb": D_msb,
                    "D_lsb": D_lsb,
                    "signed": getattr(obj, "signed", False),
                }

    def _get_reset_edge(self):
        if self.reset_edge == "1":
            self.reset_edge_active = "1'b1"
            self.reset_edge_inactive = "1'b0"
        elif self.reset_edge == "0":
            self.reset_edge_active = "1'b0"
            self.reset_edge_inactive = "1'b1"
        else:
            raise ValueError("Invalid reset edge value; expected '1' or '0'.")

    def _collect_mem_files(self):
        if not os.path.isdir(self.inputs_dir):
            raise FileNotFoundError(f"inputs_dir not found: {self.inputs_dir}")

        files = [f for f in os.listdir(self.inputs_dir) if f.lower().endswith(".mem")]
        if not files:
            raise FileNotFoundError(f"No .mem files found in: {self.inputs_dir}")

        self.mem_files = sorted(files)

    def create_testbench(self):
        with open(self.tb_file, "w") as f:
            self._write_module_declaration(f)
            self._write_signal_declarations(f)
            self._write_dut_instantiation(f)
            self._write_internal_signals(f)     # 构建并修正 InputVector
            self._write_mapping_comment(f)      # 可选：打印映射，便于对齐 .mem
            self._write_vcd_file(f)
            self._write_clock_pulse_generator(f)
            self._write_program_counter_logic(f)
            self._write_initial_block_multi_inputs(f)
            f.write("endmodule\n")

    def _write_module_declaration(self, f):
        f.write("module conquest_tb_multi();\n\n")
        f.write("// Generated multi-input top module testbench\n")

    def _write_signal_declarations(self, f):
        width_decl_len = max(
            (len(f'[{details["width"]-1}:0]') for details in self.ports_list.values() if details.get("width")),
            default=0,
        )

        for port, details in self.ports_list.items():
            type_decl = "reg" if details["direction"] == "Input" else "wire"
            sign_decl = "signed" if details.get("signed", False) else ""
            width_decl = f'[{details["width"]-1}:0]' if details.get("width") else ""

            if port in [self.clk_name, self.reset_name] or details["direction"] == "Output":
                f.write(f'{type_decl:<4} {sign_decl:<6} {width_decl:<{width_decl_len}} {port};\n')
            else:
                f.write(f"{type_decl:<4} {sign_decl:<6} {width_decl:<{width_decl_len}} {port} = {details['width']}'b0;\n")

        f.write(f'{"reg":<4} {"":<6} {"":<{width_decl_len}} __obs = 1\'b0;\n\n')

    def _write_dut_instantiation(self, f):
        f.write("\n// DUT instance\n")
        f.write(f"{self.top_module} _conc_top_inst(\n")
        max_port_length = max(len(port) for port in self.ports_list)
        for port in self.ports_list.keys():
            f.write(f"   .{port:<{max_port_length}} ({port}),\n")
        f.write(f'   .{"__obs":<{max_port_length}} (__obs));\n\n')

    def _build_and_fix_inputvector(self):
        """
        1) 构建 InputVector（调用 Utilies.InputVector）
        2) 去重同名信号（防止跨多次调用叠加）
        3) 按首次出现顺序从 LSB 开始重新分配切片与 full_width
        """
        # 调用原始构建
        InputVector(self.ports_list, self.clk_name, self.reset_name)

        vec = InputVector.InputVector
        # 保留首次出现顺序的唯一信号名
        unique = []
        seen = set()
        for name, width, _, _ in vec["sig_name_and_width"]:
            if name in seen:
                continue
            seen.add(name)
            unique.append((name, width))

        # 重新分配位段（LSB 优先）
        new_list = []
        pos = 0
        for name, width in unique:
            msb = pos + width - 1
            lsb = pos
            new_list.append((name, width, msb, lsb))
            pos += width

        vec["sig_name_and_width"] = new_list
        vec["full_width"] = pos

        return vec

    def _write_internal_signals(self, f):
        vec = self._build_and_fix_inputvector()

        signals = [
            ("[31:0]", "_conc_pc", ""),
            (f"[{vec['full_width']-1}:0]", "_conc_opcode", ""),
            (f"[{vec['full_width']-1}:0]", "_conc_ram", f"[0:{self.unroll + steps}]"),
        ]

        max_type_len = max(len(sig[0]) for sig in signals)
        max_name_len = max(len(sig[1]) for sig in signals)

        f.write("// Internal signals used in the testbench\n")
        for sig_type, sig_name, extra in signals:
            f.write(f"reg {sig_type:<{max_type_len}} {sig_name:<{max_name_len}} {extra};\n")
        f.write("reg _conc_valid;")
        f.write("\n")

    def _write_mapping_comment(self, f):
        vec = InputVector.InputVector
        f.write("// Packing map from _conc_opcode to DUT inputs (msb:lsb)\n")
        for sig_name, width, msb, lsb in vec["sig_name_and_width"]:
            f.write(f"// {sig_name:<16} <- _conc_opcode[{msb}:{lsb}]  width={width}\n")
        f.write("\n")

    def _write_clock_pulse_generator(self, f):
        f.write("// Clock pulse generator\n")
        f.write("always begin\n")
        f.write(f"    #5 {self.clk_name} = ~{self.clk_name};\n")
        f.write("end\n\n")

    def _write_program_counter_logic(self, f):
        vec = InputVector.InputVector
        f.write("// Program counter logic\n")
        f.write(f"always @(posedge {self.clk_name}) begin\n")
        f.write("    if (!reset && _conc_valid) begin\n")
        f.write("    _conc_opcode = _conc_ram[_conc_pc];\n")

        for sig_name, _, msb, lsb in vec["sig_name_and_width"]:
            if msb != lsb:
                f.write(f"    {sig_name} <= #5 _conc_opcode[{msb}:{lsb}];\n")
            else:
                f.write(f"    {sig_name} <= #5 _conc_opcode[{msb}];\n")

        for sig_name, _, _, _ in vec["sig_name_and_width"]:
            f.write(f'    $strobe(";_P {sig_name} %b", {sig_name});\n')

        f.write("    _conc_pc = _conc_pc + 1;\n")
        f.write('    $strobe(";_C %d", _conc_pc);\n')
        f.write('    $strobe(";_Input %b", _conc_opcode);\n')
        f.write("    end\n")
        f.write("end\n\n")

    def _write_initial_block_multi_inputs(self, f):
        f.write("// Generate the initial block for multiple inputs\n")
        f.write("initial begin\n")
        f.write(f"    {self.clk_name} = 1'b0;\n")
        f.write(f"    {self.reset_name} = {self.reset_edge_inactive};\n")
        f.write("    _conc_pc = 32'b0;\n")
        f.write("    _conc_valid = 1'b0;\n")

        f.write("\n    // Inputs directory and memory files\n")
        f.write(f"    // Python side collected: {self.inputs_dir}\n")

        inputs_dir = os.path.join(self.folder_pth, "inputs_history")
        for idx, mem_file in enumerate(self.mem_files):
            mem_path = os.path.join(inputs_dir, mem_file).replace("\\", "/")
            f.write(f"\n    // --- Test input {idx+1}: {mem_file} ---\n")
            f.write(f'    $display("Testing {mem_file}");\n')
            f.write(f'    $readmemb("{mem_path}", _conc_ram);\n')

            f.write(f"    _conc_pc = 32'b0;\n")
            f.write(f"    _conc_valid = 1'b0;\n")
            f.write(f"    {self.reset_name} = {self.reset_edge_active};\n")
            f.write(f"    repeat (2) @(posedge {self.clk_name});\n")
            f.write(f"    {self.reset_name} = {self.reset_edge_inactive};\n")
            f.write(f"    _conc_valid = 1'b1;\n")
            f.write(f"    repeat ({self.unroll + 2*steps}) @(posedge {self.clk_name});\n")
            f.write(f"    _conc_valid = 1'b0;\n")
        f.write("    $finish;\n")
        f.write("end\n\n")

    def _write_vcd_file(self, f):
        f.write("\n// VCD file generation\n")
        f.write("initial begin\n")
        f.write(f'    $dumpfile("{self.folder_pth}conquest_tb_multi.vcd");\n')
        f.write("    $dumpvars(0, conquest_tb_multi);\n")
        f.write("end\n\n")