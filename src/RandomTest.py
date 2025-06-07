import os
import random
import time
import resource


def memory_usage():
    # 返回当前进程使用的内存量，单位是MB
    return resource.getrusage(resource.RUSAGE_SELF).ru_maxrss / 1024.0





def read_branch_ids(folder_path, filename):
    branch_ids = []
    with open(os.path.join(folder_path, filename), 'r') as file:
        for line in file:
            branch_id = line.strip()
            branch_ids.append(int(branch_id))
    return branch_ids

def read_input_width(folder_path, filename):
    with open(os.path.join(folder_path, filename), 'r') as file:
        data_mem = file.readlines()
    return len(data_mem[0].strip())

def generate_activation_vector(clk, input_width):
    return [''.join(map(str, [random.randint(0, 1) for _ in range(input_width)])) for _ in range(clk)]

def write_rand_data(folder_path, filename, input_vector):
    file_path = os.path.join(folder_path, filename)
    print(f"Writing data to {file_path}")  # 调试信息
    with open(file_path, 'w') as file:
        for row in input_vector:
            file.write(row + '\n')


def modify_tb_file(folder_path, tb_file, input_width, clk):
    with open(os.path.join(folder_path, tb_file), 'r') as file:
        tb_content = file.readlines()

    with open(os.path.join(folder_path, tb_file), 'w') as file:
        for line in tb_content:
            if line.strip().startswith(f"reg [{input_width-1}:0]  _conc_ram"):
                line = f"reg [{input_width-1}:0]  _conc_ram   [0:{clk-1}];\n"
            file.write(line)

def run_simulation(folder_path, dut_file, tb_file):
    cmd = f"iverilog -o {folder_path}/rand_conc_run.vvp {folder_path}/{dut_file} {folder_path}/{tb_file}"
    os.system(cmd)
    cmd1 = f"vvp {folder_path}/rand_conc_run.vvp > {folder_path}/random_sim.log"
    os.system(cmd1)

def get_covered_targets(covered_target, folder_path, log_file, branch_ids):
    with open(os.path.join(folder_path, log_file), 'r') as file:
        lines = file.readlines()

    for line in lines:
        if line.strip().startswith(';A'):
            covered = int(line.split()[1])
            if covered not in covered_target and covered in branch_ids:
                covered_target.append(covered)
    return covered_target

def main(testbench):
    folder_path = f'/hpc/home/connect.ytan910/code/LLM_Concolic/test/{testbench}'
    branch_id_file = 'branch_id.txt'
    data_mem_file = 'data.mem'
    tb_file = 'conquest_tb.v'
    dut_file = 'conquest_dut.v'
    iteration = 100
    clk = 1
    start_time = time.time()
    before = memory_usage()
   

    covered_target = []
    branch_ids = read_branch_ids(folder_path, branch_id_file)
    input_width = read_input_width(folder_path, data_mem_file)
    
    modify_tb_file(folder_path, tb_file, input_width, clk)
    for i in range(iteration):
        print(f"Iteration: {i}")
        random.seed(time.time)
        input_vector = generate_activation_vector(clk, input_width)
        # write_rand_data(folder_path, 'rand_data.mem', input_vector)
        run_simulation(folder_path, dut_file, tb_file)
        covered_targets = get_covered_targets(covered_target, folder_path, 'random_sim.log', branch_ids)
        print(f"Covered target: {len(covered_targets)}")
    
    end_time = time.time()
    after = memory_usage()
    # print(f"Memory used: {after - before} MB")
    # print(f"{testbench} Execution time of main: {end_time - start_time} seconds")
    # print(f"Covered target: {len(covered_targets)}")
    # print(f"Total target number: {len(branch_ids)}")
    print(f"{testbench}: {len(covered_targets)},{len(covered_targets) / len(branch_ids) * 100:.2f}%, {end_time - start_time:.2f}s, {after - before:.2f}MB")
if __name__ == '__main__':
    # testbenches = ['b01','b06','b07','b10','b11','b14','b15']
    # testbenches = ['b19','b20','b22','b30']
    testbenches = ['b01']
    for tb in testbenches:
        main(tb)