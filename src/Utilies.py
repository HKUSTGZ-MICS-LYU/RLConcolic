import re
from GlobalVar import global_variable
from Globals import *
import random
import z3
import pyverilog.vparser.ast as vast
from z3 import *
import numpy as np

from pyverilog.vparser.ast import Constant, Minus, Power, Sll



def arithmetic_shift_right(x, shift_amount):
    # 获取 x 的位宽
    bit_width = x.size()

    # 创建符号位掩码（最高有效位）
    msb_mask = BitVecVal(1 << (bit_width - 1), bit_width)

    # 获取符号位
    msb = (x & msb_mask) != 0

    # 逻辑右移
    logical_shifted = LShR(x, shift_amount)

    # 构建符号填充掩码
    shift_amount_extended = ZeroExt(bit_width - shift_amount.size(), shift_amount)
    fill_mask = msb * (msb_mask >> shift_amount_extended)

    # 算术右移的结果
    arith_shifted = logical_shifted | fill_mask

    return arith_shifted



class InputVector:
    InputVector = {
        'sig_name_and_width': [],
        'full_width': 0,
        'msb': 0,
        'lsb': 0,
        'input_vector': [],
        'input_vector_temp': [],
        'llm_input_vector': [],
        'bing_search':[],
    }

    def __init__(self, ports_list, clk_name, reset_name):
        self.ports_list = ports_list
        self.clk_name = clk_name
        self.reset_name = reset_name
        self._cast_portlist()

    def intercept_input_vector(clock):
        InputVector.InputVector['input_vector'] = InputVector.InputVector['input_vector'][:clock]

    def intercept_llm_input_vector(clock):
        InputVector.InputVector['input_vector'] = InputVector.InputVector['llm_input_vector'][:clock]

    def _cast_portlist(self):
        for port, details in self.ports_list.items():
            if port not in [self.clk_name, self.reset_name]:
                if details['direction'] == 'Input':
                    width = 1 if details['width'] is None else details['width']
                    lsb = InputVector.InputVector['full_width']
                    InputVector.InputVector['full_width'] += width
                    msb = InputVector.InputVector['full_width'] - 1
                    InputVector.InputVector['sig_name_and_width'].append((port, width, msb, lsb))
        lsb = InputVector.InputVector['full_width']
        InputVector.InputVector['full_width'] += 1
        msb = InputVector.InputVector['full_width'] - 1
        InputVector.InputVector['sig_name_and_width'].append(('__obs', 1, msb, lsb))

        InputVector.InputVector['msb'] = InputVector.InputVector['full_width']
        InputVector.InputVector['lsb'] = 0

    @staticmethod
    def generate_oneclk_inputvector():
        input_vector = InputVector.InputVector['llm_input_vector']
        width = InputVector.InputVector['full_width']
        # row = [0 for _ in range(width)]
        row = [random.randint(0, 1) for _ in range(width)]
        input_vector.append(''.join(map(str, row)))
        InputVector.InputVector['llm_input_vector'] = input_vector
        

    @staticmethod
    def randomize_input_vector_fuzzing():
        import time
        start_time = time.time()
        InputVector.input_vector_clear()
        input_vector = InputVector.InputVector['input_vector']
        width = InputVector.InputVector['full_width']
        for _ in range(2*steps): 
            # row = [0 for _ in range(width)]
            row = [random.randint(0, 1) for _ in range(width)]
            input_vector.append(''.join(map(str, row)))
        InputVector.InputVector['input_vector'] = input_vector
        InputVector.dump_input_vector()
        end_time = time.time()
        elapsed_time = end_time - start_time
        # print(f"随机生成耗时: {elapsed_time:.4f} 秒")
        # print(f"生成了 {len(input_vector)} 个输入向量")

    @staticmethod
    def randomize_input_vector_temp():
        """
        Randomize the input vector_temp for the given steps clk cycles.
        """
        assert steps > 0, "The number of steps should be greater than 0."
        InputVector.input_vector_temp_clear()

        input_vector = InputVector.InputVector['input_vector_temp']
        width = InputVector.InputVector['full_width']
        for _ in range(steps):
            # row = [0 for _ in range(width)]
            row = [random.randint(0, 1) for _ in range(width)]
            input_vector.append(''.join(map(str, row)))
        InputVector.InputVector['input_vector_temp'] = input_vector

    @staticmethod
    def generate_unroll_temp():
        """
        Randomize the input vector_temp for the given steps clk cycles.
        """
        assert steps > 0, "The number of steps should be greater than 0."
        InputVector.input_vector_temp_clear()

        input_vector = InputVector.InputVector['input_vector']
        width = InputVector.InputVector['full_width']
        unroll_temp =[]
        for _ in range(unroll):
            # row = [0 for _ in range(width)]
            row = [random.randint(0, 1) for _ in range(width)]
            unroll_temp.append(''.join(map(str, row)))
        InputVector.InputVector['input_vector_temp'] =  unroll_temp

    

    @staticmethod
    def add_input_vector():
        input_vector = InputVector.InputVector['input_vector']
        width = InputVector.InputVector['full_width']
        while True:
            row = input(f"Enter a binary string of length {width}: ")
            if len(row) == width and all(c in '01' for c in row):
                break
            else:
                print(f"Invalid input. Please enter a binary string of length {width}.")
        input_vector.append(row)
        
        InputVector.InputVector['input_vector'] = input_vector
        InputVector.dump_input_vector()

    @staticmethod
    def input_vector_clear():
        """
        Clear the input vector.
        """
        InputVector.InputVector['input_vector'] = []

    @staticmethod
    def input_vector_temp_clear():
        """
        Clear the input vector temp.
        """
        InputVector.InputVector['input_vector_temp'] = []

    @staticmethod
    def dump_input_vector():
        """
        Dump the input vector.
        """
        with open(folder_pth + 'data.mem', 'w') as f:
            for line in InputVector.InputVector['input_vector']:
                f.write(''.join([str(i) for i in line]) + '\n')

    @staticmethod
    def dump_input_vector_temp():
        """
        Dump the input vector.
        """
        with open(folder_pth + 'data.mem', 'w') as f:
            for line in InputVector.InputVector['input_vector_temp']:
                f.write(''.join([str(i) for i in line]) + '\n')

    @staticmethod
    def dump_llm_input_vector():
        """
        Dump the input vector.
        """
        with open(folder_pth + 'data.mem', 'w') as f:
            for line in InputVector.InputVector['llm_input_vector']:
                f.write(''.join([str(i) for i in line]) + '\n')

    @staticmethod
    def concat_input_vector():
        """
        Concatenate the input vector.
        """
        InputVector.InputVector['input_vector'] = InputVector.InputVector['input_vector'] + InputVector.InputVector['input_vector_temp']
        InputVector.dump_input_vector()
    
    @staticmethod
    def generate_from_llm_vector():
        """
        Generate the llm input vector from input vector
        """
        InputVector.InputVector['input_vector'] = InputVector.InputVector['llm_input_vector']
        InputVector.dump_input_vector()



     
    @staticmethod
    def llm_input_vector_clear():
        """
        Clear the llm input vector.
        """
        InputVector.InputVector['llm_input_vector'] = []

    @staticmethod
    def repalce_input_vector(name, clock, value):
        """
        Replace the input vector.
        """
        for item in InputVector.InputVector['sig_name_and_width']:
            if item[0] == name:
                width = item[1]
                msb = item[2]
                lsb = item[3]
          
                value = format(int(value), f'0{width}b')
                a = InputVector.InputVector['input_vector'][clock]
                original_length = len(a)

                start_index = original_length - msb - 1
                end_index = original_length - lsb 
                left_part = a[:start_index]
                right_part = a[end_index:]
                result = left_part + value + right_part

                InputVector.InputVector['input_vector'][clock] = result
    
    @staticmethod
    def repalce_llm_input_vector(name, clock, value):
        """
        Replace the input vector.
        """
        for item in InputVector.InputVector['sig_name_and_width']:
            if item[0] == name:
                width = item[1]
                msb = item[2]
                lsb = item[3]
          
                value = format(value)
                a = InputVector.InputVector['llm_input_vector'][clock]
                original_length = len(a)

                start_index = original_length - msb - 1
                end_index = original_length - lsb 
                left_part = a[:start_index]
                right_part = a[end_index:]
                result = left_part + value + right_part

                InputVector.InputVector['llm_input_vector'][clock] = result


    @staticmethod
    def get_input_vector():
        """
        Get the input vector.
        """
        InputVector.input_vector_clear()
        with open(folder_pth + 'data.mem', 'r') as f:
            for lines in f:
                lines = lines.strip()
                InputVector.InputVector['input_vector'].append(lines)
        
        return InputVector.InputVector

def is_exact_word_in_text(text, word):
    pattern = r'\b' + re.escape(word) + r'\b'
    match = re.search(pattern, text)
    return match is not None

def skip_assign(str_term, reset_name):
    if is_exact_word_in_text(str_term, reset_name):
        return True
    return False

class StateVariable:
    _all_states = {}
    def __init__(self, name, value, clock):
        self.value = {} 
        self.value[clock] = value
        StateVariable._all_states[name] = self.value

    @staticmethod
    def add_state(name, value, clock):
        """
        Add a state variable.
        """
        if name not in StateVariable._all_states:
            StateVariable._all_states[name] = {}
        StateVariable._all_states[name][clock] = value

    @staticmethod
    def get_values_at_clock(clock):
        """
        Get the values of all states at the specified clock.
        Converts non-numeric values to 0.
        """
        all_values = []

        for values in StateVariable._all_states.values():
            value = values.get(clock, 0)
            try:
                numeric_value = int(value)
            except ValueError:
                numeric_value = 0

            all_values.append(numeric_value)

        return np.array(all_values)
    
    @staticmethod
    def print_all_states():
        """
        Print all state variables.
        """
        for name, values in StateVariable._all_states.items():
            print(f"{name}:")
            for clock, value in sorted(values.items()):
                print(f"  Clock {clock}: {value}")

    @staticmethod
    def get_names():
        """
        Get the names of all state variables.
        """
        # print(StateVariable._all_states.keys())
        return list(StateVariable._all_states.keys())

class Branch_Constraint:
    def __init__(self):
        self.constraint = None
        self.br = None


class Constraint:
    _constraint_index = 0
    _constraint_stack = []
    def __init__(self):
        self.constraint = None
        self.type = None
        self.clock = None
        self.obj = None
        self.index = Constraint._constraint_index
        self.assign_id = None
        Constraint._constraint_index += 1

    def clear_all_constraints():
        """
        Clear all constraints.
        """
        Constraint._constraint_stack = []
        Constraint._constraint_index = 0

    def create_clock(clock):
        """
        Create a clock constraint.
        """
        cnst = Constraint()
        cnst.constraint = Constraint.create_clock_constraint(clock)
        cnst.type = CNST_TYPE.CNST_CLK
        cnst.clock = clock
        return cnst
    
    def create_clock_constraint(clock):
        """
        Create a clock constraint.
        """
        clock_term = z3.Int('clock')
        clock_constraint = clock_term == clock
        return clock_constraint



    def create_constraint(assign, clock):
        """
        Create a constraint for the given assignment.
        """

        cnst = Constraint()
        cnst.clock = clock
        cnst.obj = assign
        cnst.assign_id = assign.id
        
        if assign.assign_type == SMTAssignType.SMT_ASSIGN_NON_BLOCKING:
            global_variable.assign_type = SMTAssignType.SMT_ASSIGN_NON_BLOCKING
            cnst.type = CNST_TYPE.CNST_ASSIGN_NON_BLOCKING
            cnst.constraint = assign._update_term(SMTCLKType.SMT_CLK_NEXT,SMTCLKType.SMT_CLK_CURR)
    
            global_variable.assign_type = None

        elif assign.assign_type == SMTAssignType.SMT_ASSIGN_BRANCH:
            global_variable.assign_type = SMTAssignType.SMT_ASSIGN_BRANCH
            cnst.type = CNST_TYPE.CNST_BRANCH
            cnst.constraint = assign._update_term(SMTCLKType.SMT_CLK_LAST)
            assign._set_covered(clock)
            global_variable.assign_type = None
       
        elif assign.assign_type == SMTAssignType.SMT_ASSIGN_BLOCKING:
            global_variable.assign_type = SMTAssignType.SMT_ASSIGN_BLOCKING
            cnst.type = CNST_TYPE.CNST_ASSIGN_BLOCKING
            cnst.constraint = assign._update_term(SMTCLKType.SMT_CLK_NEXT,SMTCLKType.SMT_CLK_CURR)
            global_variable.assign_type = None

        elif assign.assign_type == SMTAssignType.SMT_ASSIGN:
            global_variable.assign_type = SMTAssignType.SMT_ASSIGN
            cnst.type = CNST_TYPE.CNST_ASSIGN
            cnst.constraint = assign._update_term(SMTCLKType.SMT_CLK_NEXT,SMTCLKType.SMT_CLK_CURR)
            global_variable.assign_type = None

        else:
            raise ValueError("Invalid assignment type")
        
        return cnst
            

Binary_operator = (vast.Minus, vast.Power, vast.Plus)
Shift_operator = (vast.Sll)  
    
def get_params(param):
    if isinstance(param, Constant):
        return int(param.value)
    
    elif isinstance(param, Binary_operator):
        return get_params_binary(param)
    
    elif isinstance(param, Shift_operator):
        return get_params_shift(param)
    
    else:
        raise ValueError("Invalid parameter type")
    
def get_params_binary(param):
    lval = get_params(param.left)
    rval = get_params(param.right)

    if isinstance(param, Minus):
        return lval - rval
    
    elif isinstance(param, Power):
        return lval ** rval
    
    elif isinstance(param, Plus):
        return lval + rval
    
    else:
        raise ValueError("Invalid binary operator")
    
def get_params_shift(param):
    lval = get_params(param.left)
    rval = get_params(param.right)
    return lval << rval


class BeamInput:
    BeamInput = {
        'target_input_vectors': {},
        'width':1,  
    }

    @staticmethod
    def add_input_vector(target, input_vector, blockid, score=0):
        if target.id not in BeamInput.BeamInput['target_input_vectors']:
            BeamInput.BeamInput['target_input_vectors'][target.id] = []
    
        BeamInput.BeamInput['target_input_vectors'][target.id].append({
            'input_vector': input_vector,
            'score': score,
            'target': target,
            'chooseblock': blockid,
        })

    @staticmethod
    def get_input_vectors_for_target(target):
        BeamInput.sort_by_score(target)
        return [vec for vec in BeamInput.BeamInput['target_input_vectors'].get(target, [])]
    
    @staticmethod
    def get_best_input_vectors(target):
        BeamInput.sort_by_score(target)
        return [vec['input_vector'] for vec in BeamInput.BeamInput['target_input_vectors'].get(target, [])][0]
        
    @staticmethod
    def clear_target_input_vectors(target):
        """
        清除特定目标的输入向量。
        """
        BeamInput.BeamInput['target_input_vectors'][target] = []

    @staticmethod
    def sort_by_score(target):
        """
        按照score对特定目标的输入向量进行排序，得分高的排在前面。
        """
        if target in BeamInput.BeamInput['target_input_vectors']:
            BeamInput.BeamInput['target_input_vectors'][target].sort(
                key=lambda x: x['score'], reverse=True
            )
            BeamInput.BeamInput['target_input_vectors'][target] = BeamInput.BeamInput['target_input_vectors'][target][:BeamInput.BeamInput['width']]
        if target not in BeamInput.BeamInput['target_input_vectors']:
            BeamInput.BeamInput['target_input_vectors'][target] = []  # Initialize as empty list if not found


    @staticmethod
    def remove_duplicates(target):
        """
        对于相同的 'chooseblock': blockid, 保留 input_vector 长度最长的一个，其他的删除。
        """
        if target in BeamInput.BeamInput['target_input_vectors']:
            unique_blocks = {}
            for vec in BeamInput.BeamInput['target_input_vectors'][target]:
                blockid = vec['chooseblock']
                if blockid not in unique_blocks:
                    unique_blocks[blockid] = vec
                else:
                    # Compare input_vector lengths and retain the longest one
                    if vec['score'] > unique_blocks[blockid]['score']:
                        unique_blocks[blockid] = vec

            # Update the target_input_vectors with the filtered list
            BeamInput.BeamInput['target_input_vectors'][target] = list(unique_blocks.values())
        