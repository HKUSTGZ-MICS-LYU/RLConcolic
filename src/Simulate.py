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
import shutil





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

    for iteration in range(random_sim):
        print(f"[RANDOM] Randomize input vector for initial simulation, iteration {iteration+1}")
        seed = int(time.time() * 1000) % (2**32)
        random.seed(seed)
        InputVector.randomize_fuzzing()
        simulate_build_stack()
        remove_and_process_covered_targets()
        save_input()
        path = InputVector.get_input_vector()
        SMTBasicBlock.update_all_closest_paths(path, Constraint._constraint_stack)
    start_time = time.time()

    while len(SMTBasicBlock._target_list) > 0:
        if len(SMTBasicBlock._target_list) == 0:
            break
        else:
            target = SMTBasicBlock._target_list[0]

        for iteration in range(1):
            seed = int(time.time() * 1000) % (2**32)
            random.seed(seed)
            InputVector.randomize_input_vector_fuzzing()
            sim_not_cnst()
            if remove_and_process_covered_targets():
                print("[Save input] Find new covered targets during randomization.")
                save_input()
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
                save_input()
                if not target.assign_list[0].covered_in_sim:
                    SMTBasicBlock._target_list.pop(0)
                    SMTBasicBlock._uncovered_target_list.append(target)
                global_variable.clear_target()
                InputVector.input_vector_clear()
                Constraint._constraint_stack.clear()
                temp_time = time.time() - start_time
                break
            if target.assign_list[0].covered_in_sim:
                global_variable.explore_time = 0
                save_input()
                remove_and_process_covered_targets()
                global_variable.clear_target()
                temp_time = time.time() - start_time
                break

    print_cover_clock()

def concolic_iteration(path):
    init_clock = len(path['input_vector'])
    if global_variable.first_explore_label:
        global_variable.begin_clock = 0
    else:
        global_variable.begin_clock =  init_clock 
    explore_one_step()
    current_clock = len(path['input_vector'])

    if(find_next_cfg(init_clock, current_clock,path)):
        s.reset()
        path = InputVector.InputVector
    return path

def explore_one_step():
    InputVector.randomize_input_vector_temp()
    InputVector.concat_input_vector()
    simulate_build_stack()
    if remove_and_process_covered_targets():
        # print("[Save input] Find new covered targets during explore one step.")
        save_input()



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
        uncover_dict = get_available_branches(uncover_branches, 2, end_clock)
        global_variable.first_explore_label = False
    else:
        uncover_dict = get_available_branches(uncover_branches,begin_clock +1 , end_clock)

    branches = sort_and_filter_branches(uncover_dict)
    branches.reverse()

    check_num = 0


    for item in branches:
        unsat_flag = False
        check_num += 1
        clock = item.constraint.clock
        s.reset()
        idx = 0    

        # add constraints before the clock

        while(Constraint._constraint_stack[idx].clock < clock ):
            if Constraint._constraint_stack[idx].type != CNST_TYPE.CNST_CLK and Constraint._constraint_stack[idx].clock > begin_clock:
                s.add(simplify(Constraint._constraint_stack[idx].constraint))
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

        
        # solve the constraints
        if s.check() == z3.sat:
            explored_branches.append(item.br.id)
            global_variable.explore_time +=1
            find_flag = True
            assign = SMTAssign.get_assign(item.br.id)
            InputVector.InputVector['input_vector'] = input_vector
            global_variable.branch = item
            model = s.model()
            print_results(model)
            get_the_next_path(clock)
            
            InputVector.input_vector_temp_clear()
            InputVector.generate_unroll_temp()
            InputVector.concat_input_vector()
            InputVector.dump_input_vector()
            sim_not_cnst()
            if remove_and_process_covered_targets():
                save_input()

            item.br.block.distance += 1
            if global_variable.target.assign_list[0].covered_in_sim:
                return True
            if random.randint(0,1) == 0:
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



def sim():
    if simulator == 'iverilog':
        cmd = f"vvp {folder_pth}conc_run.vvp > {folder_pth}sim.log"
    elif simulator == 'verilator':
        cmd = f'{folder_pth}obj_dir/Vconquest > {folder_pth}sim.log'
    os.system(cmd)


def save_input():
    """
    在inputs_history下创建input_x子文件夹，并在其中保存data.mem文件
    """
    input_file = os.path.join(folder_pth, "data.mem")
    inputs_dir = os.path.join(folder_pth, "inputs_history")
    os.makedirs(inputs_dir, exist_ok=True)
    
    existing = [d for d in os.listdir(inputs_dir) if os.path.isdir(os.path.join(inputs_dir, d)) 
               and d.startswith("input")]
    next_id = len(existing) + 1
    
    new_dir = os.path.join(inputs_dir, f"input{next_id}")
    os.makedirs(new_dir, exist_ok=True)
    
    backup_file = os.path.join(new_dir, "data.mem")
    shutil.copy(input_file, backup_file)
    return backup_file


def build_stack():
    start_time = time.time()
    f_test = open(folder_pth + 'sim.log', 'r')
    read_time = time.time() - start_time
    assert f_test, "The simulation log file is not found."
    clock = 0
    stop_clock = 0
    latest_val = None
    latest_block = []
    reg_block = []
    begin_clock = global_variable.begin_clock
    started = False
    Constraint._constraint_stack.append(Constraint.create_clock(clock))
    SMTSigCore._set_wire_version(clock) 
    SMTSigCore._set_variable_version(clock)
    clock_count = 0

    while True:
        stripped_line = f_test.readline().strip()
        val = stripped_line.split()
        if val != []:
            if val[0] == ';_C':
                clock = int(val[1])
                if clock >= begin_clock:
                    if not started:
                        started = True
                    if clock == stop_clock:
                        break
                    Constraint._constraint_stack.append(Constraint.create_clock(clock))
                    SMTSigCore._set_wire_version(clock) 
                    SMTSigCore._set_variable_version(clock)
                    clock_count += 1
                    for _, assign in SMTAssign._assign_list.items():
                        if assign.assign_type == SMTAssignType.SMT_ASSIGN:
                            Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                            # print(f"Assign ID {assign.id},block ID {assign.block.id},constraint {Constraint.create_constraint(assign, clock).constraint}")
                
            elif not started:
                continue          
               
            elif val[0] == ';A':
                assign_id = int(val[1])
                assign = SMTAssign.get_assign(assign_id)
                Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                if assign.block.id not in latest_block:
                    latest_block.append(assign.block.id)

            elif val[0] == ';_Input':
                input = val[1]
                if input.startswith('x'):
                    stop_clock = clock + 1

            elif val[0] == ';R':
                if assign.block.id not in reg_block:
                    reg_block.append(assign.block.id)
                state_name = val[1]
                state_val = val[3]
                StateVariable.add_state(state_name, state_val, clock)

            latest_val = val
    end_time = time.time()  
    elapsed_time = end_time - start_time 
    print(f"建立约束耗时 {elapsed_time:.2f}")
    print(f"begin clock is {begin_clock}, end clock is {stop_clock}, clock count is {clock_count}")

def sim_not_cnst():
    sim()
    f_test = open(folder_pth + 'sim.log', 'r')
    assert f_test, "The simulation log file is not found."
    clock = 0
    stop_clock = 0
    
    while True:
        stripped_line = f_test.readline().strip()
        val = stripped_line.split()
        if val != []:
            if val[0] == ';_C':
                clock = int(val[1])
                if clock == stop_clock:
                    break
                
            elif val[0] == ';A':
                assign_id = int(val[1])
                assign = SMTAssign.get_assign(assign_id)
                if assign.assign_type == SMTAssignType.SMT_ASSIGN_BRANCH:
                    assign._set_covered(clock) #仿真到了算覆盖到
        
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


def print_cover_clock():
    sorted_targets = sorted(SMTBasicBlock._covered_target_list, key=lambda target: target.assign_list[0].covered_at_clock)
    for target in sorted_targets:
        print(f"Target {target.id} is covered in clock {target.assign_list[0].covered_at_clock}")

def remove_and_process_covered_targets():
    find_new_covered = False
    for i in range(len(SMTBasicBlock._target_list) - 1, -1, -1):
        target = SMTBasicBlock._target_list[i]
        for assign in target.assign_list:
            if assign.covered_in_sim:
                find_new_covered = True
                print(f"[COVERED] Removing target {target.id}, the assign is {target.assign_list[0].id}, at clock {assign.covered_at_clock}")
                if target not in SMTBasicBlock._covered_target_list:
                    SMTBasicBlock._covered_target_list.append(target)
                SMTBasicBlock._target_list.pop(i)
                if assign.covered_at_clock == 0:
                    input_vector = InputVector.InputVector['input_vector'][:]
                else:
                    input_vector = InputVector.InputVector['input_vector'][:assign.covered_at_clock]
    return find_new_covered