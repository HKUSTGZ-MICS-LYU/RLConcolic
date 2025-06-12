import os
import random
from SMTlib import SMTBasicBlock, SMTBranch, SMTProcess, SMTSigCore, SMTAssign
from Utilies import Branch_Constraint, InputVector, StateVariable, Constraint, BeamInput
from Globals import *
import z3
from z3 import *
from DQN import *
from LLM import *
import itertools
from GlobalVar import global_variable
from Globals import *
import time
from tqdm import tqdm
from multiprocessing import Pool
import multiprocessing
import requests
import json
import sys
from pathlib import Path
import math
from collections import defaultdict
import re





def init():
    # Compile the necessary components
    compile()
    
    # Update global variable for branch dimensions
    branch_dim = 0
    for _, assign in SMTAssign._assign_list.items():
        if assign.assign_type != SMTAssignType.SMT_ASSIGN:
            branch_dim += 1        

    global_variable.branch_dim = branch_dim
    
    # Calculate state dimensions based on the type of signals
    reg_count = count_registers()
    global_variable.state_dim = reg_count

def count_registers():
    cnt = 0
    for signame, sigcore in SMTSigCore._sigcore_list.items():
        if sigcore.type == DATA_TYPE.REG:
            cnt += sigcore.depth_count
    return cnt



def compile():
    if simulator == "iverilog":
        cmd = f"iverilog -o {folder_pth}conc_run.vvp " + dut_file + " " + tb_file
        print(f"[INFO] Running command: {cmd}")
        os.system(cmd)
        
    if simulator == "verilator":
        current_path = os.getcwd()
        os.chdir(folder_pth)
        print(f"[INFO] Changed working directory to: {os.getcwd()}")

        cmd = f"verilator -Wno-fatal --cc conquest.v --exe sim_main.cpp --no-timing -O0 "
        print(f"[INFO] Running command: {cmd}")
        os.system(cmd)
        cmd1 = f"make -C obj_dir -f Vconquest.mk Vconquest"
        print(f"[INFO] Running command: {cmd1}")
        os.system(cmd1)
        os.chdir(current_path)



def select_target(branch_file_path):
    with open(branch_file_path, 'r') as f_branch_id:
        print("[INFO] Select the target branch from the branch_id.txt file")
        for line in f_branch_id:
            clean_line = line.strip()
            if not clean_line:
                continue
            branch_id = clean_line
            if branch_id:
                assign = SMTAssign.get_assign(int(branch_id))
                assert assign.assign_type == SMTAssignType.SMT_ASSIGN_BRANCH, "The assign type is not branch"
                SMTBasicBlock.add_target(assign.block)

    return SMTBasicBlock



def single_target_coverage():
    SMTBasicBlock.extract_cfg()
    SMTSigCore.clear_all_versions()
    SMTBasicBlock.edge_realignment()
    SMTBasicBlock.update_all_targets_distance()
    SMTBasicBlock.print_all_targets_distance()
    SMTProcess.make_circular()

    # for iteration in range(random_sim):
    #     seed = int(time.time() * 1000) % (2**32)
    #     random.seed(seed)
    #     InputVector.randomize_input_vector_fuzzing()
    #     simulate_build_stack()
    #     remove_and_process_covered_targets()
    #     path = InputVector.get_input_vector()
    #     SMTBasicBlock.update_all_closest_paths(path, Constraint._constraint_stack)

    start_time = time.time()

    while len(SMTBasicBlock._target_list) > 0:
        # get the target
        if len(SMTBasicBlock._target_list) == 0:
            break
        else:
            target = SMTBasicBlock._target_list[0]
    
        for iteration in range(3):
            seed = int(time.time() * 1000) % (2**32)
            random.seed(seed)
            InputVector.randomize_input_vector_fuzzing()
            simulate_build_stack()
            remove_and_process_covered_targets()
            path = InputVector.get_input_vector()
            SMTBasicBlock.update_all_closest_paths(path, Constraint._constraint_stack)
            
        if len(SMTBasicBlock._target_list) == 0:
            break
        else:
            target = SMTBasicBlock._target_list[0]
        
        target.update_distance_from_adjacency_list()
        print(f"[TARGET] Trying to cover target {target.id}, the assign is {target.assign_list[0].id}")
        if target.closest_path is None and target.closest_path != path:
            path = target.closest_path
            path.dump_input_vector()

        global_variable.add_target(target)
        global_variable.first_explore_label = True
        while (path := concolic_iteration(path)):
            if len(path['input_vector']) > unroll :   
                global_variable.explore_time = 0
                if not target.assign_list[0].covered_in_sim:
                    SMTBasicBlock._target_list.pop(0)
                    SMTBasicBlock._uncovered_target_list.append(target)
                global_variable.clear_target()
                InputVector.input_vector_clear()
                Constraint._constraint_stack.clear()
                temp_time = time.time() - start_time
                print(f"[INFO] The time of the target is {temp_time:.2f} seconds")
                break
            if target.assign_list[0].covered_in_sim:
                global_variable.explore_time = 0
                # InputVector.generate_unroll_temp()
                # InputVector.concat_input_vector()
                # sim_not_cnst()
                remove_and_process_covered_targets()
                global_variable.clear_target()
                temp_time = time.time() - start_time
                print(f"[INFO] The time of the target is {temp_time:.2f} seconds")
                break

    print_cover_clock()


def get_input_vector_file():
    filename = llm_input_file
    sig_name_and_width = [item[0] for item in InputVector.InputVector['sig_name_and_width']]
    clock_values = extract_line_values(filename,sig_name_and_width)
    for clock,line in enumerate(clock_values):
        InputVector.generate_oneclk_inputvector()
        for item in sig_name_and_width:
            if item != '__obs':
                InputVector.repalce_llm_input_vector(item, clock+1, line[item])
    InputVector.dump_llm_input_vector()
    
def extract_line_values(filename, sig_name_and_width):
    line_values = []

    with open(filename, 'r') as file:
        lines = file.readlines()
        for line in lines:
            # 去掉行尾的换行符并分割字符串
            parts = line.strip().split(', ')
            values = {}
            for part in parts:
                sig_name, value = part.split('=')
                values[sig_name.strip()] = value.strip()
            
            # 提取 sig_name_and_width 中的信号值并存储到字典中
            line_dict = {}
            for sig_name in sig_name_and_width:
                if sig_name in values:
                    line_dict[sig_name] = values[sig_name]
                else:
                    line_dict[sig_name] = None
            
            line_values.append(line_dict)
    
    return line_values

def print_branches(sorted_branches):
    f = open(folder_pth + 'branches.txt', 'w')
    f.write("[BRANCHES] Sorted Branches:\n")
    for idx, item in enumerate(sorted_branches):
        f.write(f"[{idx}]:Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock}\n")
    f.close()



def beam_concolic_iteration(path):
    
    target = global_variable.target

    if global_variable.first_explore_label:
        closest_fuzzing(target)
        # Search the path of the covered parent blocks
        for parent in target.assign_list[0].parent_node.branch_list[::]:
            if parent.covered_in_sim == True and parent.block.id in BeamInput.BeamInput['target_input_vectors'] and parent.block.id != target.id:
                parent_path = BeamInput.get_best_input_vectors(parent.block.id)
                BeamInput.add_input_vector(target,parent_path[:],parent.block.id,0.2)
                # print(f"[INFO] Add the path of coverd parent block {parent.block.id} to the target {target.id}")
        # Search the closest path of the uncovered targets
        # sorted_adjacency_list = sorted(target.adjacency_list.items(), key=lambda item: item[1])
        # for index, (id, value) in enumerate(sorted_adjacency_list):
        #     if value < 2 and id in BeamInput.BeamInput['target_input_vectors'] and id != target.id:
        #         closest_path = BeamInput.get_best_input_vectors(id)
        #         BeamInput.add_input_vector(target,closest_path[:],id,0.1)
                # print(f"[INFO] Add the closest path of block {id} to the target {target.id}")
    BeamInput.add_input_vector(target,path['input_vector'],0,0)
    beam_pathes = BeamInput.get_input_vectors_for_target(target.id)
    BeamInput.clear_target_input_vectors(target.id)
    for beam_path in beam_pathes:
        InputVector.InputVector['input_vector'] = beam_path['input_vector']
        init_clock = len(InputVector.InputVector['input_vector'])
        explore_one_step()
        current_clock = len(InputVector.InputVector['input_vector'])

        if(find_next_cfg(init_clock, current_clock,InputVector.InputVector)):
            s.reset()
        else:
            BeamInput.add_input_vector(target,InputVector.InputVector['input_vector'],0,0)

        if target.assign_list[0].covered_in_sim:
            break

    BeamInput.sort_by_score(target.id)
    # BeamInput.remove_duplicates(target.id)
    InputVector.InputVector['input_vector'] = BeamInput.get_best_input_vectors(target.id)
    path = InputVector.InputVector
    global_variable.first_explore_label = False

    return path

def concolic_iteration(path):

    target = global_variable.target
    # if global_variable.first_explore_label:
    #     closest_fuzzing(target)

    init_clock = len(path['input_vector'])
    print(f"Explore one step with clock {init_clock}")
    explore_one_step()
    current_clock = len(path['input_vector'])

    if(find_next_cfg(init_clock, current_clock,path)):
        s.reset()
        path = InputVector.InputVector
    return path

def closest_fuzzing(target):
    sorted_adjacency_list = sorted(target.adjacency_list.items(), key=lambda item: item[1])
    for index, (id, value) in enumerate(sorted_adjacency_list):
        if value < 3 and id in BeamInput.BeamInput['target_input_vectors'] and id != target.id:
            # print(f"[INFO] Add the closest path of block {id} to the target {target.id}")
            closest_path = BeamInput.get_best_input_vectors(id)
            InputVector.InputVector['input_vector'] = closest_path
            InputVector.generate_unroll_temp()
            InputVector.concat_input_vector()
            sim_not_cnst()
            remove_and_process_covered_targets()

def explore_one_step():
    InputVector.randomize_input_vector_temp()
    InputVector.concat_input_vector()
    simulate_build_stack()
    remove_and_process_covered_targets()



def find_next_cfg( init_clock, current_clock,path):
    input_vector = path['input_vector']
    begin_clock = init_clock + 1
    end_clock = current_clock 
    find_flag = False

    branches = []
    uncover_branches = []
    temp_branches = []

    explored_branches = []
    global dqn_init
    global dqn_agent
   
    size = len(Constraint._constraint_stack)

    parent_id = []
    for item in global_variable.target.assign_list[0].parent_node.branch_list:
        parent_id.append(item.block.id)
    

    idx = 0
    while(Constraint._constraint_stack[idx].clock == 0):
        idx += 1
    for i in range(idx, size):
        cnst = Constraint._constraint_stack[i]
        if cnst.type == CNST_TYPE.CNST_BRANCH:
            br = cnst.obj
            node = br.parent_node
            for item in node.branch_list:
                # if item != br:
                alt_br = Branch_Constraint()
                alt_br.br = item
                alt_br.constraint = cnst
                if item.block.id not in BeamInput.BeamInput['target_input_vectors']:
                    uncover_branches.append(alt_br)
                else:
                    temp_branches.append(alt_br)


    if global_variable.first_explore_label:
        temp_branch_dict = get_available_branches(temp_branches, 1, end_clock)
        uncover_dict = get_available_branches(uncover_branches, 1, end_clock)
    else:
        temp_branch_dict = get_available_branches(temp_branches, begin_clock, end_clock)
        uncover_dict = get_available_branches(uncover_branches,begin_clock, end_clock)

    branches = sort_and_filter_branches(uncover_dict)
    branches.reverse()    
    sorted_branches = branches + sort_and_filter_branches(temp_branch_dict)
    print(f"[INFO] The number of branches is {len(sorted_branches)} begin clock is {begin_clock}, end clock is {end_clock}")

    check_num = 0


    for item in sorted_branches:
        unsat_flag = False
        check_num += 1
        clock = item.constraint.clock
        # print(f"Choosing Branch id is {item.br.id},at clock {clock},constraint is {item.constraint.constraint}")
        s.reset()
        idx = 0    

        # add constraints before the clock

        while(Constraint._constraint_stack[idx].clock < clock ):
            if Constraint._constraint_stack[idx].type != CNST_TYPE.CNST_CLK and Constraint._constraint_stack[idx].clock > begin_clock:
                s.add(simplify(Constraint._constraint_stack[idx].constraint))
                # print(f"Assign is {Constraint._constraint_stack[idx].assign_id},clock is {Constraint._constraint_stack[idx].clock},constriant is {simplify(Constraint._constraint_stack[idx].constraint)}")
                # if s.check() == z3.unsat:
                    # print("The constraints are unsatisfiable before the clock of the branch.")
                    # print_constraints(s)
                    # continue
            idx += 1

        assert Constraint._constraint_stack[idx].clock == clock, "The clock is not equal to the clock of the branch constraint."
        assert Constraint._constraint_stack[idx].type == CNST_TYPE.CNST_CLK, "The type is not equal to the clock of the branch constraint."        
        idx += 1

        # restore the version of the signals
        SMTSigCore.restore_version(clock)

        if s.check() == z3.unsat:
            print(f"[UNSAT] Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock} The constraints before clock are unsat.")
            s.reset()

        # add constraints at the same clock 添加同周期但非mutate目标的cnst
        target_process = item.constraint.obj.process
        while(Constraint._constraint_stack[idx]._constraint_index != item.constraint._constraint_index):
            process = Constraint._constraint_stack[idx].obj.process
            if(not process.is_edge_triggered or process == target_process):
                s.add(simplify(Constraint._constraint_stack[idx].constraint))

            idx += 1
        
        # add the mutated branch constraint
        s.add(simplify(item.br._update_term(SMTCLKType.SMT_CLK_CURR)))

        SMTSigCore.data_synchronization(clock)

        if s.check() == z3.unsat:
            unsat_flag = True
            print(f"[INFO] Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock} The constraints after mutate are unsat.")
            s.reset()

        
        # solve the constraints
        if s.check() == z3.sat:
            explored_branches.append(item.br.id)
            global_variable.explore_time +=1
            find_flag = True
            assign = SMTAssign.get_assign(item.br.id)
            assign._set_covered(clock)
            print(f"[Enter] Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock}, distance is {item.br.block.distance}")
            InputVector.InputVector['input_vector'] = input_vector
            global_variable.branch = item
            model = s.model()
            print_results(model)
            get_the_next_path(clock)
            remove_and_process_covered_targets()
        
            # 生成下一个时钟周期的输入向量，然后仿真
            # if not unsat_flag:
            #     print(f"[EXTEND] Extend simulation for block ID {item.br.block.id}at clock {item.constraint.clock}")
            #     InputVector.input_vector_temp_clear()
            #     InputVector.generate_unroll_temp()
            #     InputVector.concat_input_vector()
            #     InputVector.dump_input_vector()
            #     sim_not_cnst()


            # if not global_variable.target and not unsat_flag:
            #     BeamInput.add_input_vector(global_variable.target,InputVector.InputVector['input_vector'],item.br.block.id,999)
            # if global_variable.target.assign_list[0].covered_in_sim and not unsat_flag:
            #     BeamInput.add_input_vector(global_variable.target,InputVector.InputVector['input_vector'],item.br.block.id,999)

            # score = len(InputVector.InputVector['input_vector'])**0.75*1/(item.br.block.distance+1)
            # score = 1/(item.br.block.distance+1)
            # BeamInput.add_input_vector(global_variable.target,InputVector.InputVector['input_vector'],item.br.block.id,score)
            # item.br.block.distance += 1
            if check_num >= len(branches) and random.randint(0,1) == 0:
                return True
        global_variable.branch = None
    return find_flag
       
def get_the_next_path(clock):

    InputVector.intercept_input_vector(clock)
    file = open(folder_pth + 'result.txt', 'r')
    for line in file:
        line = line.strip()
        name_clock, value = line.split(" = ")
        name, clock = name_clock.rsplit("_", 1)
        # int(clock) - number: number is the clock of reset number
        if int(clock) <=2:
            InputVector.repalce_input_vector(name, int(clock)-1, value)
        else:
            if llm_agent == True:
                InputVector.repalce_input_vector(name, int(clock)-1, value)
            else:
                InputVector.repalce_input_vector(name, int(clock)-2, value)
    InputVector.dump_input_vector()



def print_results(model):
    f = open(folder_pth + 'result.txt', 'w')
    for item in model:
        f.write(f"{item} = {model[item]}\n")
    f.close()



def get_available_branches(branches, begin_clock, end_clock):
    branch_dict = {}
    for br in branches:
        if br.br.block.distance != 999:
            if br.constraint.clock >= begin_clock and br.constraint.clock <= end_clock:
                if br.br.id in branch_dict:
                    branch_dict[br.br.id].append(br)
                else:
                    branch_dict[br.br.id] = [br]

    return branch_dict

def sort_branches_by_distance(branches):
    sorted_branches = sorted(branches, key=lambda x: x.br.block.distance)
    return sorted_branches

def simulate_build_stack():
    sim()
    SMTSigCore.clear_all_versions()
    Constraint.clear_all_constraints()
    build_stack()



# Todo ：Change to vri
def sim():
    import time
    start_time = time.time()

    if simulator == 'iverilog':
        cmd = f"vvp {folder_pth}conc_run.vvp > {folder_pth}sim.log"
    # print(f"[INFO] Running command: {cmd}")
    elif simulator == 'verilator':
        cmd = f'{folder_pth}obj_dir/Vconquest > {folder_pth}sim.log'
    os.system(cmd)

    end_time = time.time()  
    elapsed_time = end_time - start_time 
    # print(f"仿真耗时 {elapsed_time:.2f}")


def build_stack():
    import time
    start_time = time.time()

    f_test = open(folder_pth + 'sim.log', 'r')

    read_time = time.time() - start_time
    # print(f"读取仿真日志耗时 {read_time:.2f}")

    assert f_test, "The simulation log file is not found."

    clock = 0
    stop_clock = 0
    latest_val = None
    latest_block = []
    reg_block = []
    Constraint._constraint_stack.append(Constraint.create_clock(clock))
    SMTSigCore._set_wire_version(clock) 
    SMTSigCore._set_variable_version(clock)

    
  

    while True:
        stripped_line = f_test.readline().strip()
        val = stripped_line.split()
        if val != []:
            if val[0] == ';_C':
                clock = int(val[1])
                if clock == stop_clock:
                    break
                
                Constraint._constraint_stack.append(Constraint.create_clock(clock))
                SMTSigCore._set_wire_version(clock) 
                SMTSigCore._set_variable_version(clock)
                for _, assign in SMTAssign._assign_list.items():
                    if assign.assign_type == SMTAssignType.SMT_ASSIGN:
                        Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                        # print(f"Assign ID {assign.id},block ID {assign.block.id},constraint {Constraint.create_constraint(assign, clock).constraint}")
                          
               
            elif val[0] == ';A':
                assign_id = int(val[1])
                assign = SMTAssign.get_assign(assign_id)
                Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                # check the block 
                if assign.block.id not in latest_block:
                    latest_block.append(assign.block.id)



            elif val[0] == ';_Input':
                input = val[1]
                if input.startswith('x'):
                    stop_clock = clock + 1

            elif val[0] == ';R':
                if assign.block.id not in reg_block:
                    reg_block.append(assign.block.id)
                # b20时序问题和非阻塞问题 在每个block reg变化前，把所有基本赋值操作的约束都再添加一遍
                # if latest_val[0] == ';A':
                #     # print(f"Block {latest_block}")
                #     for _, assign in SMTAssign._assign_list.items():
                #         if assign.assign_type == SMTAssignType.SMT_ASSIGN :
                #             # print(f"Assign ID {assign.id}")
                #             Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                state_name = val[1]
                state_val = val[3]
                StateVariable.add_state(state_name, state_val, clock)

            latest_val = val
    end_time = time.time()  
    elapsed_time = end_time - start_time 
    print(f"建立约束耗时 {elapsed_time:.2f}")
            
    

def sim_not_cnst():
    sim()
    f_test = open(folder_pth + 'sim.log', 'r')
    assert f_test, "The simulation log file is not found."
    clock = 0
    stop_clock = 0
    
    if global_variable.branch is None:
        pass
    else: 
        br = global_variable.branch.br
        clk = global_variable.branch.constraint.clock
        if br.block.assign_list:
            branch_id = br.block.assign_list[0].id
        while True:
            stripped_line = f_test.readline().strip()
            val = stripped_line.split()
            if val != []:
                if val[0] == ';_C':
                    clock = int(val[1])
                    if clock == stop_clock:
                        # print("[INFO] Not cover the branch selected.")
                        break
                    
                elif val[0] == ';A':
                    assign_id = int(val[1])
                    assign = SMTAssign.get_assign(assign_id)
                    if assign.assign_type == SMTAssignType.SMT_ASSIGN_BRANCH:
                        assign._set_covered(clock) #仿真到了就算覆盖到
            
                elif val[0] == ';_Input':
                    input = val[1]
                    if input.startswith('x'):
                        stop_clock = clock + 1


def print_constraints(solver):
    f = open(folder_pth + 'debug.txt', 'w')
    f.write("[CONSTRAINTS] Constraints:\n")
    for item in solver.assertions():
        f.write(str(item) + '\n')
    f.close()

def print_sorted_branches(sorted_branches, state, state_name):
    f = open(folder_pth + 'sorted_branches.txt', 'w')
    f.write("[BRANCHES] Sorted Branches:\n")
    for idx, item in enumerate(sorted_branches):
        f.write(f"[{idx}]:Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock}\n")
    f.write("[STATE] State:\n")
    for name, value in zip(state_name, state):
        f.write(f"{name}: {value}\n")
    f.close()


def find_assignments(file_path, inputs, states):
    with open(file_path, 'r') as file:
        verilog_code = file.read()

    # 匹配阻塞赋值或非阻塞赋值的正则表达式
    assignment_pattern = re.compile(r"(\w+)\s*(<=|=)\s*(.+);")
    
    # 存储变量之间的赋值关系
    assignments = defaultdict(list)
    
    # 查找所有赋值语句
    for match in assignment_pattern.findall(verilog_code):
        variable, operator, expression = match
        variable = variable.strip()
        expression = expression.strip()
        assignments[variable].append(expression)
    
    # 找到由输入赋值的状态变量
    affected_states = set()

    def find_affected_states(input_list):
        nonlocal affected_states
        for state in states:
            for expr in assignments[state]:
                involved_vars = expr
                if any(input_var in involved_vars for input_var in input_list):
                    if state not in affected_states:
                        affected_states.add(state)
                        # 递归查找由当前状态变量影响的其他状态变量
                        find_affected_states([state])
    
    # 从输入开始递归查找
    find_affected_states(inputs)
    
    return affected_states


def print_cover_clock():
    sorted_targets = sorted(SMTBasicBlock._covered_target_list, key=lambda target: target.assign_list[0].covered_at_clock)
    for target in sorted_targets:
        print(f"Target {target.id} is covered in clock {target.assign_list[0].covered_at_clock}")

def remove_and_process_covered_targets():
    """
    原有函数:SMTBasicBlock.remove_covered_targets()
    移除已覆盖的目标，并将相关信息添加到 BeamSearch 中。
    """
    for i in range(len(SMTBasicBlock._target_list) - 1, -1, -1):
        target = SMTBasicBlock._target_list[i]
        for assign in target.assign_list:
            if assign.covered_in_sim:
                print(f"[COVERED] Removing target {target.id}, the assign is {target.assign_list[0].id}, at clock {assign.covered_at_clock}")
                # 检查目标是否已在覆盖列表中，避免重复添加
                if target not in SMTBasicBlock._covered_target_list:
                    SMTBasicBlock._covered_target_list.append(target)
                # 从目标列表中移除该目标
                SMTBasicBlock._target_list.pop(i)

                # 调用 BeamSearch.add_cover_branch 来处理覆盖的目标
                if assign.covered_at_clock == 0:
                    input_vector = InputVector.InputVector['input_vector'][:]
                else:
                    input_vector = InputVector.InputVector['input_vector'][:assign.covered_at_clock]
                if target.id not in BeamInput.BeamInput['target_input_vectors']:
                    BeamInput.add_input_vector(target,input_vector,target.id,999)
                break  
