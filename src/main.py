import os
import argparse
import time
from memory_profiler import memory_usage
from DutCreate import CreateDut
from TbCreate import CreateTestBench
from MultiTbCreate import CreateMultiInputTestBench
import Globals
from SMTlib import SMTBasicBlock, SMTBranch, dump_branch_id, select_target
from Simulate import init, single_target_coverage
from pyverilog.vparser.parser import VerilogCodeParser


def monitor_memory(func):
    def wrapper(*args, **kwargs):
        mem_usage_before = memory_usage(-1)[0]
        result = func(*args, **kwargs)
        mem_usage_after = memory_usage(-1)[0]
        print(f"Memory usage of {func.__name__}: {mem_usage_after - mem_usage_before} MiB")
        return result
    return wrapper


class Concolic:
    def __init__(self, 
                 file_pth: str, 
                 top_module: str, 
                 clk_name: str, 
                 reset_name: str,
                 reset_edge: str,
                 unroll: int, 
                 steps: int, 
                 limit_iter: int, 
                 random_sim: int
                 ):
        """
        Initialize the concolic testing framework with the given parameters.

        Parameters:
        - file_pth (str): Path to the Verilog file(s).
        - top_module (str): Name of the top module.
        - clk_name (str): Name of the clock signal.
        - reset_name (str): Name of the reset signal.
        - unroll (int): Unroll parameter for the simulator.
        - steps (int): Number of steps for simulation.
        - limit_iter (int): Limitation on the iteration for concolic execution.
        - random_sim (int): Parameter to control random simulation aspects.
        """
        assert file_pth, "file_pth cannot be None"
        assert unroll is not None, "unroll cannot be None"
        assert steps is not None, "steps cannot be None"
        assert limit_iter is not None, "limit_iter cannot be None"
        assert random_sim is not None, "random_sim cannot be None"

      
        self.unroll = unroll
        self.steps = steps
        self.limit_iter = limit_iter
        self.random_sim = random_sim

        self.top_module = top_module
        self.clk_name = clk_name
        self.reset_name = reset_name
        self.reset_edge = reset_edge


        self.file_pth = [file_pth]  
        self.folder_pth = os.path.dirname(file_pth) + '/'
        self.dut_file = self.folder_pth + 'conquest_dut.v'
        self.tb_file = self.folder_pth + 'conquest_tb.v'
        self.multi_tb_file = self.folder_pth + 'conquest_tb_multi.v'

        # Initialization 
        self.start_time = 0
        self.end_time = 0

    def main(self):
        """
        Main function to start the concolic testing.
        """
 

        # Step 1: Generate the testbench
        self.generate_testbench(self.folder_pth)

        # Step 2: Generate the dut and CFG
        self.generate_dut_cfg()

        # Step 3: Run the concolic execution
        self.run_concolic()

        # Step 4: Generate the coverage report
        self.generate_coverage_report()

        # Step 5: Generate multi-input testbench and doublecheck coverage with simulation log
        self.multi_testbench()
        self.doublecheck_branch_coverage()

    def generate_testbench(self, folder_pth):
        """
        Generate the testbench for the given Verilog file(s).
        """
        # Parse the Verilog file and extract the AST
        codeparser = VerilogCodeParser(self.file_pth)
        self.ast = codeparser.parse()

        # Write the AST to a file
        with open(self.folder_pth + 'conquest.txt', 'w') as f:
            self.ast.show(buf=f)

        # Check if the module is flattened
        assert len(self.ast.description.definitions) == 1, "The module is not flattened"

        # Create the testbench
        create_testbench = CreateTestBench(self.ast, self.top_module, self.clk_name, self.reset_name, self.reset_edge, self.folder_pth, self.unroll)
        create_testbench.main()    
 

    def generate_dut_cfg(self):
        """
        Generate the DUT and CFG for the given Verilog file(s).
        """
        CreateDut(self.ast, self.top_module, self.unroll, self.reset_name, self.folder_pth).main()

    @monitor_memory
    def run_concolic(self):
        """
        Run the concolic execution for the given Verilog file(s).
        """
        # Initialize the simulator and get state, branch diminsions
        init()

        self.start_time = time.time()
        # Dump the all the branch IDs
        dump_branch_id()
        target_count = select_target()
        SMTBranch._target_count = target_count
        print(f"[INFO] Target count: {target_count}")
        SMTBasicBlock.get_targets_info()

        single_target_coverage()


    def generate_coverage_report(self):
        """
        Generate the coverage report for the concolic execution.
        """
        print(f"The current testbench is {Globals.testbench}")
        self.end_time = time.time()
        print(f"Time taken: {self.end_time - self.start_time} seconds")
        SMTBasicBlock.print_covered_result()

    def multi_testbench(self):
        inputs_dir = os.path.join(self.folder_pth, 'inputs_history')
        all_coverage = set()
        
        for input_dir in sorted(os.listdir(inputs_dir)):
            if not input_dir.startswith('input'):
                continue
                
            input_folder = os.path.join(inputs_dir, input_dir)
            if not os.path.isdir(input_folder):
                continue
                
            # 在input文件夹中创建tb文件
            tb_file = os.path.join(input_folder, 'conquest_tb.v')
            data_mem = os.path.join(input_folder, 'data.mem')
            
            # 生成新的tb文件
            with open(self.tb_file, 'r') as f:
                content = f.read()
            
            # 更新data.mem路径
            modified_content = content.replace(
                f'$readmemb("{self.folder_pth}data.mem"',
                f'$readmemb("{data_mem}"'
            )
            
            with open(tb_file, 'w') as f:
                f.write(modified_content)
            
            # 编译和运行
            compile_cmd = f"iverilog -o {input_folder}/conc_run.vvp {self.dut_file} {tb_file}"
            print(f"[INFO] Running command: {compile_cmd}")
            os.system(compile_cmd)
            
            sim_cmd = f"vvp {input_folder}/conc_run.vvp > {input_folder}/sim.log"
            print(f"[INFO] Running command: {sim_cmd}")
            os.system(sim_cmd)
            
        # 合并所有sim.log
        with open(f"{self.folder_pth}multisim.log", 'w') as outfile:
            for input_dir in sorted(os.listdir(inputs_dir)):
                if not input_dir.startswith('input'):
                    continue
                input_folder = os.path.join(inputs_dir, input_dir)
                sim_log = os.path.join(input_folder, 'sim.log')
                if os.path.exists(sim_log):
                    with open(sim_log, 'r') as infile:
                        outfile.write(infile.read())

    def doublecheck_branch_coverage(self):
        print("Double checking branch coverage from simulation log...")
        branch_id_file = os.path.join(self.folder_pth, 'branch_id.txt')
        log_file = os.path.join(self.folder_pth, 'multisim.log')

        with open(branch_id_file, 'r') as f:
                all_branches = [int(line.strip()) for line in f if line.strip() != '']
                all_branches = set(all_branches)

        covered = set()
        # add covered branches from log
        with open(log_file, 'r') as f:
            for line in f:
                line = line.strip()
                if line.startswith(';A '):
                    try:
                        bid = int(line.split()[1])
                        covered.add(bid)
                    except:
                        print(f"[ERROR] 解析行失败: {line}, 错误: {str(e)}")
                        pass

        not_covered = sorted(all_branches - covered)
        covered_sorted = sorted(all_branches & covered)
        coverage_rate = len(covered_sorted) / len(all_branches) if all_branches else 0
        print("需要覆盖分支数:", len(all_branches))
        print("已覆盖分支数:", len(covered_sorted))
        print("未覆盖分支数:", len(not_covered))
        print("覆盖率: {:.2%}".format(coverage_rate))
        print("未覆盖分支:", not_covered)

if __name__ == '__main__':


    # create a parser object
    parser = argparse.ArgumentParser(description='Concolic testing framework')


    parser.add_argument('-f', '--file_pth',
                        type=str, 
                        default=Globals.file_pth,
                        help='Path to the Verilog file(s)')
    parser.add_argument('-t', '--top-module', 
                        type=str,
                        default=Globals.top_module, 
                        help='Name of the top module')
    parser.add_argument('-c', '--clk-name', 
                        type=str, 
                        default=Globals.clk_name, 
                        help='Name of the clock signal')
    parser.add_argument('-e', 
                        '--reset-name', 
                        type=str, 
                        default=Globals.reset_name, 
                        help='Name of the reset signal')
    parser.add_argument('-d', 
                        '--reset-edge', 
                        type=str, 
                        default=Globals.reset_edge,
                        help='Edge of the reset signal')
    parser.add_argument('-u', 
                        '--unroll', 
                        type=int, 
                        default=Globals.unroll,
                        help='Unroll parameter for the simulator')
    parser.add_argument('-s', 
                        '--steps', 
                        type=int, 
                        default=Globals.steps,
                        help='Number of steps for simulation')
    parser.add_argument('-l', 
                        '--limit_iter', 
                        type=int, 
                        default=Globals.limit_iter,
                        help='Limitation on the iteration for concolic execution')
    parser.add_argument('-r', 
                        '--random-sim', 
                        type=int, 
                        default=Globals.random_sim,
                        help='Parameter to control random simulation aspects')


    parser.add_argument('-v', '--version', action='version', version='%(prog)s 1.0')

    # parse the arguments
    args = parser.parse_args()
 
    # create an object of Concolic class
    concolic = Concolic(file_pth=args.file_pth, 
                        top_module = args.top_module, 
                        clk_name = args.clk_name,
                        reset_name = args.reset_name, 
                        reset_edge = args.reset_edge,
                        unroll=args.unroll, 
                        steps=args.steps, 
                        limit_iter=args.limit_iter, 
                        random_sim=args.random_sim
                        )
    concolic.main()
    
    