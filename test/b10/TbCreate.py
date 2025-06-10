
from Utilies import InputVector, get_params
from pyverilog.vparser.ast import *
from Globals import *
class CreateTestBench:
    def __init__(self, ast, top_module, clk_name, reset_name, reset_edge, folder_pth, unroll):
        """
        Constructor for the CreateTestBench class.
        """
        self.ast = ast
        self.top_module = top_module
        self.clk_name = clk_name
        self.reset_name = reset_name
        self.reset_edge = reset_edge
        self.unroll = unroll
        self.tb_file = folder_pth + 'conquest_tb.v'
        self.data_mem_file = folder_pth + 'data.mem'
        self.reset_level = None
        self.reset_edge_active = None
        self.reset_edge_inactive = None

    def main(self):
        """
        Create the testbench for the given Verilog file(s).
        """
        # Step 1: Extract the module information
        self._extract_module_info()

        # Step 2: Create the testbench
        self.create_testbench()

    def _extract_module_info(self):
        # Step1: Extract the ports list
        self._get_ports_list()

        # Step2: Extract the variables list
        self._get_variables_list()

        # Step3: Extract reset edge
        self._get_reset_edge()

    def _get_ports_list(self):
        """
        Extract the ports list from the AST.
        """
        # Extract the ports list
        self.ports_list = {}
        for port in self.ast.description.definitions[0].portlist.ports:
            msb = get_params(port.first.width.msb) if port.first.width else 0
            lsb = get_params(port.first.width.lsb) if port.first.width else 0
            width = msb - lsb + 1  
            self.ports_list[port.first.name] = {
                "direction": port.first.__class__.__name__,
                'msb': msb,
                'lsb': lsb,
                "width":  width,
                'signed': port.first.signed,
                'type': port.second.__class__.__name__ if port.second else 'wire'
            }

    def _get_variables_list(self):
        """
        Extract the variables list from the AST.
        """
        # Extract the variables list
        self.variables_list = {}
        for item in self.ast.description.definitions[0].items:
            if isinstance(item, Decl):
                W_msb = get_params(item.list[0].width.msb) if item.list[0].width else 0
                W_lsb = get_params(item.list[0].width.lsb) if item.list[0].width else 0
                D_msb = get_params(item.list[0].dimensions.lengths[0].msb) if item.list[0].dimensions else 0
                D_lsb = get_params(item.list[0].dimensions.lengths[0].lsb) if item.list[0].dimensions else 0
                Width = W_msb - W_lsb + 1
                Depth = abs(D_msb - D_lsb) + 1 if item.list[0].dimensions else None
                self.variables_list[item.list[0].name] = {
                    'type': item.list[0].__class__.__name__,
                    'Width': Width,
                    'W_msb': W_msb,
                    'W_lsb': W_lsb,
                    'Depth': Depth,
                    'D_msb': D_msb if item.list[0].dimensions else 0,
                    'D_lsb': D_lsb if item.list[0].dimensions else 0,
                    'signed': item.list[0].signed
                }

    def _get_reset_edge(self):
        """
        Determine the active and inactive states of reset signals based on their activation edge.
        """
        if self.reset_edge == '1':
            self.reset_edge_active = "1'b1"
            self.reset_edge_inactive = "1'b0"
        elif self.reset_edge == '0':
            self.reset_edge_active = "1'b0"
            self.reset_edge_inactive = "1'b1"
        else:
            raise ValueError("Invalid reset edge value")




    def create_testbench(self):
        """
        Generate and write the testbench file based on the provided information.
        """
        # Step 1: Create the testbench file
        with open(self.tb_file, 'w') as f:
            # Step 2: Write the module declaration
            self._write_module_declaration(f)

            # Step 3: Write the clock and reset signals
            self._write_signal_declarations(f)

            # Step 4: Write the DUT instantiation
            self._write_dut_instantiation(f)

            # Step 5: Write the internal signals
            self._write_internal_signals(f)
            
            # Step 6: Write the vcd file
            # self._write_vcd_file(f)

            # Step 7: Write the clock and reset generators
            # self._write_clock_pluse_generator(f)

            # Step 8: Write the program counter logic
            self._write_program_counter_logic(f)

            # Step 9: Write the initial block
            self._write_initial_block(f)

      

            f.write("endmodule\n")

    def _write_module_declaration(self, f):
        """
        Write the module declaration to the testbench file.
        """

        f.write(f"module conquest_tb(input {self.clk_name}, input {self.reset_name});\n\n")
        f.write('// Generated top module signals\n')

    def _write_signal_declarations(self, f):
        """
        Write signal declarations for inputs, outputs, and internal signals.
        """
     
        width_decl_len = max((len(f'[{details["width"]-1}:0]') for details in self.ports_list.values() if details.get('width')), default=0)

        for port, details in self.ports_list.items():
            type_decl = 'reg' if details['direction'] == 'Input' else 'wire'
            sign_decl = 'signed' if details.get('signed', False) else ''
            width_decl = f'[{details["width"]-1}:0]' if details.get('width') else ''
            if details['direction'] == 'Output':
                f.write(f'{type_decl:<4} {sign_decl:<6} {width_decl:<{width_decl_len}} {port};\n')
            elif port in [clk_name, reset_name]:
                continue
            else:
                f.write(f"{type_decl:<4} {sign_decl:<6} {width_decl:<{width_decl_len}} {port} = {details['width']}'b0;\n")
        f.write(f'{"reg":<4} {"":<6} {"":<{width_decl_len}} __obs = 1\'b0;\n\n')
                
    def _write_dut_instantiation(self, f):
        """
        Write the DUT instantiation to the testbench file.
        """
        f.write('\n// DUT instance\n')
        f.write(f'{self.top_module} _conc_top_inst(\n')
        max_port_length = max(len(port) for port in self.ports_list)
        for port, _ in self.ports_list.items():
            f.write(f'   .{port:<{max_port_length}} ({port}),\n')
        f.write(f'   .{"__obs":<{max_port_length}} (__obs));\n\n')

    def _write_internal_signals(self, f):
        """
        Write the internal signals to the testbench file.
        """

        InputVector(self.ports_list, self.clk_name, self.reset_name)

        signals = [
            ('[31:0]', '_conc_pc', ''),
            (f"[{InputVector.InputVector['full_width']-1}:0]", '_conc_opcode', ''),
            (f"[{InputVector.InputVector['full_width']-1}:0]", '_conc_ram', f'[0:{self.unroll+ steps*3}]')
        ]
        
        max_type_len = max(len(sig[0]) for sig in signals)
        max_name_len = max(len(sig[1]) for sig in signals)

        f.write('// Internal signals used in the testbench\n')
        for sig_type, sig_name, extra in signals:
            f.write(f'reg {sig_type:<{max_type_len}} {sig_name:<{max_name_len}} {extra};\n')

        f.write('\n')

    def _write_clock_pluse_generator(self, f):
        """
        Write the clock pulse generator logic.
        """
        f.write('// Clock pulse generator\n')
        f.write('always begin\n')
        f.write(f'    #5 {clk_name} = ~{clk_name};\n')
        f.write('end\n\n')

    def _write_program_counter_logic(self, f):
        """
        Write the logic for the program counter and related operations.
        """
        f.write('// Program counter logic\n')
        f.write(f'always @(posedge {clk_name}) begin\n')
        
        # Write program counter logic
        f.write('    _conc_opcode = _conc_ram[_conc_pc];\n')
        
        # Assign signals from input vector
        for sig_name_and_width in InputVector.InputVector['sig_name_and_width']:
            sig_name, _, msb, lsb = sig_name_and_width
            if msb != lsb:
                f.write(f"    {sig_name} <= #5 _conc_opcode[{msb}:{lsb}];\n")
            else:
                f.write(f"    {sig_name} <= #5 _conc_opcode[{msb}];\n")

        # Strobe for output ports
        for sig_name, sig_attrs in self.ports_list.items():
            sig_type = sig_attrs['type']
            direction = sig_attrs['direction']
            if direction == 'Output' and sig_type == 'Reg':
                f.write(f'    $strobe(";R {sig_name} %d", _conc_top_inst.{sig_name});\n')

        # Strobe for variables
        for sig_name, var_attrs in self.variables_list.items():
            type = var_attrs['type']
            msb = var_attrs['W_msb']
            lsb = var_attrs['W_lsb']
            depth = var_attrs['Depth']
            if type != 'Reg':
                continue
            if depth:
                # Strobe for array variables
                for i in range(depth):
                    f.write(f'    $strobe(";R {sig_name}[{i}] %d", _conc_top_inst.{sig_name}[{i}]);\n')
            else:
                # Strobe for scalar variables
                f.write(f'    $strobe(";R {sig_name} %d", _conc_top_inst.{sig_name});\n')

                    
        # Increment the program counter
        f.write('    _conc_pc = _conc_pc + 1;\n')
        f.write('    $strobe(";_C %d", _conc_pc);\n')
        f.write('    $strobe(";_Input %b", _conc_opcode);\n')
        f.write('end\n\n')

    def _write_initial_block(self, f):
        f.write('// Generate the initial block\n')
        f.write('initial begin\n')
        # f.write(f'    {clk_name} = 1\'b0;\n')
        # f.write(f'    {reset_name} = {self.reset_edge_inactive};\n')
        f.write('    _conc_pc = 32\'b0;\n')
        f.write(f'    $readmemb("{self.data_mem_file}", _conc_ram);\n')
        # f.write(f'    #5 {clk_name} = 1\'b1;\n')
        # f.write(f'    {reset_name} = {self.reset_edge_active};\n')
        # f.write(f'    #10 {reset_name} = {self.reset_edge_inactive};\n')
        # f.write('    #{} $finish;\n'.format(unroll * 10 + (steps * 2) * 10)) # sim仿真文件的最大clk数
        f.write('end\n')

    def _write_vcd_file(self, f):
        f.write('\n// VCD file generation\n')
        f.write('initial begin\n')
        f.write(f'    $dumpfile("{folder_pth}conquest_tb.vcd");\n')
        f.write('    $dumpvars(0, conquest_tb);\n')
        f.write('end\n\n')

