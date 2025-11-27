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


def calculate_distance(target_state, state):
    distance = 0

    for key, value in state.items():
        if key in target_state and value is not None:
            distance += abs(target_state[key] - value)
            if debug: print(f"target: {key}: {target_state[key]}; state: {key}: {value}")

    if 'gamma' in target_state and'gamma' in state:
        distance = abs(target_state['gamma'] - state['gamma'])

    return distance


def calculate_reward(state_distance, block_distance):
    block_weight = 0.5
    state_weight = 0.5


    if block_distance <= 10:
        block_reward = 5-block_distance
    else:
        block_reward = -1

    if state_distance <= 3:
        state_reward = 5-state_distance
    else:
        state_reward = -1
    

    return block_weight*block_reward + state_weight*state_reward


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

    while len(SMTBasicBlock._target_list) > 300:
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
                print(f"[INFO] The time of the target is {temp_time:.2f} seconds")
                break
            if target.assign_list[0].covered_in_sim:
                global_variable.explore_time = 0
                save_input()
                if remove_and_process_covered_targets():
                    print("[Save input] Find new covered targets during concolic iteration.")
                    save_input()
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
            parts = line.strip().split(', ')
            values = {}
            for part in parts:
                sig_name, value = part.split('=')
                values[sig_name.strip()] = value.strip()
        
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



def concolic_iteration(path):
    init_clock = len(path['input_vector'])
    explore_one_step()
    current_clock = len(path['input_vector'])
    
    if(find_next_cfg(init_clock, current_clock)):
        s.reset()
        # check_branch_coverage()
        path = InputVector.InputVector
    
    return path

def explore_one_step():
    InputVector.randomize_input_vector_temp()
    InputVector.concat_input_vector()
    simulate_build_stack()
    remove_and_process_covered_targets()


def find_next_cfg( init_clock, current_clock):
    begin_clock = init_clock + 1
    end_clock = current_clock

    branches = []
    global dqn_init
    global dqn_agent
    global path_num
    size = len(Constraint._constraint_stack)

    
    transition_dict = {'states': [],'actions': [],'next_states': [],'rewards': []}

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
                branches.append(alt_br)


    if global_variable.first_explore_label:
        branch_dict = get_available_branches(branches, 2, end_clock)
        global_variable.first_explore_label = False
    else:
        branch_dict = get_available_branches(branches, begin_clock, end_clock)
    

    state = StateVariable.get_values_at_clock(begin_clock-1)
    state_name = StateVariable.get_names()

    previous_state = {}
    for name, value in zip(state_name, state):
        previous_state[name] = value
    if global_variable.target.dqn_init == False: 
        dqn_agent = DQN(state.size, global_variable.branch_dim, learning_rate, gamma, epsilon, target_update, device)
        global_variable.target.dqn_init = True
    sorted_branches = dqn_agent.take_action(state, branch_dict)


    for item in sorted_branches:
        # print_sorted_branches(sorted_branches, state, state_name)
        # mannual select which branch to take    
        if debug:
            user_input = input("Enter the index to select an item (or press Enter to continue with this item): ").strip()
            if user_input:
                selected_index = int(user_input)
                if selected_index >= 0 and selected_index < len(sorted_branches):
                    item = sorted_branches[selected_index]
                else:
                    print("Invalid index. Please try again.")
                    continue
            

        clock = item.constraint.clock
        s.reset()
        idx = 0    
        print(f"Choosing Branch id is {item.br.id},at clock {clock},constraint is {item.constraint.constraint}")

        # add constraints before the clock
        while(Constraint._constraint_stack[idx].clock < clock):
            if Constraint._constraint_stack[idx].type != CNST_TYPE.CNST_CLK and Constraint._constraint_stack[idx].clock > 1:
                s.add(Constraint._constraint_stack[idx].constraint)   
                # if s.check() == z3.unsat:
                #     print("The constraints are unsatisfiable before the clock of the branch.")
                #     print_constraints(s)
                #     quit()
            idx += 1
    
        # Debug: Check the cnst is SAT before add the mutate branch
        if s.check() == z3.unsat:
            print("Unsat before mutate")
        #     return False
        # print_constraints(s)


        assert Constraint._constraint_stack[idx].clock == clock, "The clock is not equal to the clock of the branch constraint."
        assert Constraint._constraint_stack[idx].type == CNST_TYPE.CNST_CLK, "The type is not equal to the clock of the branch constraint."        
        idx += 1

        # restore the version of the signals
        SMTSigCore.restore_version(clock)

        # add constraints at the same clock
        target_process = item.constraint.obj.process
        while(Constraint._constraint_stack[idx] != item.constraint):
            process = Constraint._constraint_stack[idx].obj.process
            if(not process.is_edge_triggered or process == target_process):
                s.add(Constraint._constraint_stack[idx].constraint)  
            idx += 1


        s.add(item.br._update_term(SMTCLKType.SMT_CLK_CURR))

        SMTSigCore.data_synchronization(clock)
        # print_constraints(s)
        # solve the constraints
        if s.check() == z3.sat:
            assign = SMTAssign.get_assign(item.br.id)
            assign._set_covered(clock)

            global_variable.branch = item
            model = s.model()
            print_results(model)
            get_the_next_path(clock)
            InputVector.input_vector_temp_clear()
            if item.br.id == global_variable.target.assign_list[0].id:
                global_variable.target.assign_list[0].covered_in_sim = True
            
            sim_not_cnst()
            remove_and_process_covered_targets()

            # DQN UPDATE
            path_num += 1
            action = item.br.id
            state = StateVariable.get_values_at_clock(clock)
            state_name = StateVariable.get_names()
            current_state = {}
            for name, value in zip(state_name, state):
                current_state[name] = value
            if hasattr(global_variable.get_target(), 'cnst_state'): 
                target_state = global_variable.get_target().cnst_state
            else:
                target_state = {}
            state_distance = calculate_distance(target_state, current_state)
            block_distance = item.br.block.distance
            item.br.block.distance += 1
            reward = calculate_reward(state_distance,block_distance)
            print(f"[Enter] Block ID {item.br.block.id} assign ID {item.br.id} at clock {item.constraint.clock} reward = {reward}")
            # print(f"\nTaget:{global_variable.target.id}, Choosing assign: {item.br.id}, Choosing Clock:{clock},Block distance:{block_distance},State distance: {state_distance}, Reward: {reward}")
            next_state = StateVariable.get_values_at_clock(clock)
            transition_dict['states'].append(state)
            transition_dict['actions'].append(action)
            transition_dict['next_states'].append(next_state)
            transition_dict['rewards'].append(reward)
            dqn_agent.update(transition_dict)

            if path_num == 3 :
                dqn_agent.update(transition_dict)
                transition_dict = {'states': [],'actions': [],'next_states': [],'rewards': []}
                path_num = 0 
                return True
     
          
        global_variable.branch = None
    return False
       
def get_the_next_path(clock):

    InputVector.intercept_input_vector(clock)
    file = open(folder_pth + 'result.txt', 'r')
    for line in file:
        line = line.strip()
        name_clock, value = line.split(" = ")
        name, clock = name_clock.rsplit("_", 1)
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


def get_line_num(file_path):
    try:
        with open(file_path, 'r') as file:
            line_num = sum(1 for _ in file)
        return line_num
    except FileNotFoundError:
        print(f"[ERROR] File not found: {file_path}")
        return 0
    
def build_stack():
    f_test = open(folder_pth + 'sim.log', 'r')

    assert f_test, "The simulation log file is not found."

    clock = 0
    
    stop_clock = get_line_num(folder_pth + 'data.mem')
    latest_val = None
    latest_block = []
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
                state_name = val[1]
                state_val = val[2]
                if state_name == 'register':
                    # print(f"Block {latest_block}")
                    for _, assign in SMTAssign._assign_list.items():
                        if assign.assign_type == SMTAssignType.SMT_ASSIGN :
                            # print(f"Assign ID {assign.id}")
                            Constraint._constraint_stack.append(Constraint.create_constraint(assign, clock))
                if state_name != 'register':
                    StateVariable.add_state(state_name, state_val, clock)

            latest_val = val
            



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
    """
    移除已覆盖的目标，并将相关信息添加到 BeamSearch 中。
    """
    for i in range(len(SMTBasicBlock._target_list) - 1, -1, -1):
        target = SMTBasicBlock._target_list[i]
        for assign in target.assign_list:
            if assign.covered_in_sim:
                print(f"[COVERED] Removing target {target.id}, the assign is {target.assign_list[0].id}, at clock {assign.covered_at_clock}")
                if target not in SMTBasicBlock._covered_target_list:
                    SMTBasicBlock._covered_target_list.append(target)
                SMTBasicBlock._target_list.pop(i)

                input_vector = InputVector.InputVector['input_vector'][:assign.covered_at_clock]
                if target.id not in BeamInput.BeamInput['target_input_vectors']:
                    BeamInput.add_input_vector(target,input_vector,target.id,999)
                break  

def sim_not_cnst():
    sim()
    f_test = open(folder_pth + 'sim.log', 'r')

    assert f_test, "The simulation log file is not found."

    clock = 0
    
    stop_clock = get_line_num(folder_pth + 'data.mem')
    latest_val = None
    latest_block = []
    Constraint._constraint_stack.append(Constraint.create_clock(clock))
    SMTSigCore._set_wire_version(clock) 
    SMTSigCore._set_variable_version(clock)
    
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

def save_input():
    """
    备份当前 folder_pth 下的 data.mem 文件到 inputs_history 文件夹，文件名用自增编号防止重复。
    """
    input_file = os.path.join(folder_pth, "data.mem")
    inputs_dir = os.path.join(folder_pth, "inputs_history")
    os.makedirs(inputs_dir, exist_ok=True)
    existing = [f for f in os.listdir(inputs_dir) if f.startswith("data_") and f.endswith(".mem")]
    next_id = len(existing) + 1
    backup_file = os.path.join(inputs_dir, f"data_{next_id}.mem")
    shutil.copy(input_file, backup_file)
    print(f"Saved input: {backup_file}")
    return backup_file
