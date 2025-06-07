from collections import deque
from logging import info
from math import ceil, log2
import random
import z3
from z3 import *
from enum import Enum, auto
from GlobalVar import global_variable
from Utilies import arithmetic_shift_right, get_params, skip_assign
import pyverilog
from pyverilog.vparser.ast import *
from Globals import *
from collections import deque

ast_Lor = pyverilog.vparser.ast.Lor
ast_Eq = pyverilog.vparser.ast.Eq
ast_NotEq = pyverilog.vparser.ast.NotEq
ast_Or = pyverilog.vparser.ast.Or
ast_Xor = pyverilog.vparser.ast.Xor
ast_Plus = pyverilog.vparser.ast.Plus
ast_Minus = pyverilog.vparser.ast.Minus
ast_Times = pyverilog.vparser.ast.Times
ast_Divide = pyverilog.vparser.ast.Divide
ast_Mod = pyverilog.vparser.ast.Mod
ast_Sll = pyverilog.vparser.ast.Sll
ast_Srl = pyverilog.vparser.ast.Srl
ast_LessThan = pyverilog.vparser.ast.LessThan
ast_LessEq = pyverilog.vparser.ast.LessEq
ast_GreaterThan = pyverilog.vparser.ast.GreaterThan
ast_GreaterEq = pyverilog.vparser.ast.GreaterEq
ast_Power = pyverilog.vparser.ast.Power
ast_Ulnot = pyverilog.vparser.ast.Ulnot
ast_Unot = pyverilog.vparser.ast.Unot
ast_Land = pyverilog.vparser.ast.Land
ast_And = pyverilog.vparser.ast.And
ast_Uminus = pyverilog.vparser.ast.Uminus
ast_Uplus = pyverilog.vparser.ast.Uplus
ast_Unor = pyverilog.vparser.ast.Unor
ast_Uor = pyverilog.vparser.ast.Uor
ast_Xnor = pyverilog.vparser.ast.Xnor
ast_Uand = pyverilog.vparser.ast.Uand
ast_Sra = pyverilog.vparser.ast.Sra
ast_Uxor = pyverilog.vparser.ast.Uxor
binary_expr_map = (ast_Xnor, ast_And, ast_Eq, ast_NotEq, ast_Lor, ast_Land, ast_Or, ast_Xor, ast_LessThan, ast_LessEq, ast_GreaterThan, ast_GreaterEq, ast_Plus, ast_Minus, ast_Times, ast_Divide, ast_Mod, ast_Sll, ast_Srl, ast_Power,ast_Sra)
unary_expr_map = (ast_Uand, ast_Ulnot, ast_Unot, ast_Land, ast_Uminus, ast_Uplus, ast_Unor, ast_Uor, ast_Uxor)


class SMTSigCore:
    _sig_counter = 0
    _sigcore_list = {}

    def __init__(self, signal):
        self.id = SMTSigCore._sig_counter
        SMTSigCore._sig_counter += 1

        if isinstance(signal, Ioport):
            self.name = signal.first.name
            self.width, self.msb, self.lsb = self._get_width(signal.first.width)
            self.zeros = smt_zeros(self.width)
            self.is_signed = signal.first.signed
            self.current_version = 0
            self.next_version = 0
            self.depth_count = 1
            self.version_at_clock = {}
            self.term = self._get_term(signal)
            self.term_alias = None
            self.term_stack = self._create_stmt_term_stack(self.term)
            self.term_stack_alias = []
            self.assignment_list = []
            if isinstance(signal.first, Input):
                self.is_state = False
                self.is_array = False
                self.type = DATA_TYPE.INPUT
                SMTSigCore._sigcore_list[self.name] = self
            elif isinstance(signal.first, Output):
                self.is_state = False
                self.is_array = False
                if signal.second:
                    self.type = DATA_TYPE.REG
                else:
                    self.type = DATA_TYPE.WIRE
                SMTSigCore._sigcore_list[self.name] = self
            else:
                raise ValueError("Unsupported signal type")
         
        elif isinstance(signal, Reg) or isinstance(signal, Integer):
            self.name = signal.name
            self.width, self.msb, self.lsb = self._get_width(signal.width)
            self.zeros = smt_zeros(self.width)
            self.is_signed = signal.signed
            self.current_version = 0
            self.next_version = 0
            self.depth_count = self._get_depth(signal)
            self.version_at_clock = {}
            self.term = self._get_term(signal)
            self.term_alias = None
            self.term_stack = self._create_stmt_term_stack(self.term)
            self.term_stack_alias = []
            self.assignment_list = []
            self.is_state = True
            if self.depth_count > 1:
                self.is_array = True
            else:
                self.is_array = False
            self.type = DATA_TYPE.REG
            SMTSigCore._sigcore_list[self.name] = self

        # translate Wire type to Reg type
        elif isinstance(signal, Wire):
            self.name = signal.name
            self.width, self.msb, self.lsb = self._get_width(signal.width)
            self.zeros = smt_zeros(self.width)
            self.is_signed = signal.signed
            self.current_version = 0
            self.next_version = 0
            self.depth_count = 1
            self.version_at_clock = {}
            self.term = self._get_term(signal)
            self.term_alias = None
            self.term_stack = self._create_stmt_term_stack(self.term)
            self.term_stack_alias = []
            self.assignment_list = []
            self.is_state = False
            self.is_array = False
            self.type = DATA_TYPE.WIRE
            SMTSigCore._sigcore_list[self.name] = self
         
    @staticmethod
    def clear_all_versions():
        for sig in SMTSigCore._sigcore_list.values():
            sig.current_version = 0
            sig.next_version = 0
            sig.version_at_clock = {}
            

    def _get_depth(self, signal):
        if signal.dimensions:
            D_msb = get_params(signal.dimensions.lengths[0].msb)
            D_lsb = get_params(signal.dimensions.lengths[0].lsb)
            Depth = abs(D_msb - D_lsb) + 1
            return Depth
        else:
            return 1

    def _get_width(self, width):
        if width:
            msb = get_params(width.msb)
            lsb = get_params(width.lsb)
            width = msb - lsb + 1
            if(msb < lsb):
                KeyError("msb < lsb => currently not supported")
        else:
            msb = 0
            lsb = 0
            width = 1
        return width, msb, lsb
    
    @staticmethod
    def restore_version(clock):
        for _,details in SMTSigCore._sigcore_list.items():
            if details.type == DATA_TYPE.REG:
                details.current_version = details.version_at_clock[clock]
                details.next_version = details.current_version
        SMTSigCore._set_wire_version(clock)

    def _get_term(self, signal):
        if isinstance(signal, Ioport):
            var_name = signal.first.name
            var_width = self.width if signal.first.width else 1
            term = BitVec(var_name, var_width)
            return term
        elif isinstance(signal, Reg) or isinstance(signal, Integer):
            var_name = signal.name
            var_width = self.width if signal.width else 1
            var_depth = self.depth_count
            if var_depth > 1:
                var_depth_bin = get_bin_from_int(var_depth)
                term = Array(var_name, BitVecSort(var_depth_bin), BitVecSort(var_width))
            else:
                term = BitVec(var_name, var_width)
            return term
        elif isinstance(signal, Wire):
            var_name = signal.name
            if signal.width:
                if not isinstance(signal.width.msb, IntConst):
                    signal.width.msb = cal_sig_width(signal.width.msb)
                if not isinstance(signal.width.lsb, IntConst):
                    signal.width.lsb = cal_sig_width(signal.width.lsb)
            
            var_width = int(str(signal.width.msb)) - int(str(signal.width.lsb)) + 1 if signal.width else 1
          
            term = BitVec(var_name, var_width)
            return term
        else:
            raise ValueError("Unsupported signal type")
        
    # For example, if the signal is a 4-bit signal, the index should be 2 bit
    # the signal is a 5-bit signal, the index should be log2(5)+1
    def assign_term_alias(self, term):
        if self.depth_count == 1:
            alias_width = math.log2(self.width)
            if alias_width - math.floor(alias_width) > 0:
                alias_width = int(math.floor(alias_width) + 1)
            
            if len(self.term_stack_alias) == 0:
                for i in range(len(self.term_stack)):
                    self.term_stack_alias.append(None)   

            # Replace the term_stack with the alias term
            for i in range(len(self.term_stack)):
                self.term_alias = Array('arr_' + self.name + f"_{i}", BitVecSort(int(alias_width)), BitVecSort(1))
                for j in range(self.width):
                    Store(self.term_alias,BitVecVal(j,int(alias_width)),Extract(j, j, term))
                self.term_stack_alias[i] = self.term_alias

    def _create_stmt_term_stack(self, term):
        term_stack = []
        for i in range(unroll + (steps * 3)):
            if isinstance(term, BitVecRef):
                width = term.size()
                term_stack.append(BitVec(f"{term}_{i}", width))
            elif isinstance(term, ArrayRef):
                width = term.sort().range()
                Depth = term.sort().domain()
                term_stack.append(Array(f"{term}_{i}", Depth, width))
            elif isinstance(term, BoolRef):
                term_stack.append(Bool(f"{term}_{i}"))
            else:
                raise ValueError("Unsupported term type")
        return term_stack
 
    def _update_next_version(self):
        self.next_version += 1
        if (self.next_version == len(self.term_stack)):
            if isinstance(self.term, BitVecRef):
                width = self.term.size()
                self.term_stack.append(BitVec(f"{self.term}_{self.next_version}", width))
            elif isinstance(self.term, ArrayRef):
                width = self.term.sort().range()
                Depth = self.term.sort().domain()
                self.term_stack.append(Array(f"{self.term}_{self.next_version}", Depth, width))
            elif isinstance(self.term, BoolRef):
                self.term_stack.append(Bool(f"{self.term}_{self.next_version}"))
            else:
                raise ValueError("Unsupported term type")
            
        if (self.next_version == len(self.term_stack_alias)):
            if isinstance(self.term, BitVecRef):
                width = self.term.size()
                self.term_stack_alias.append(BitVec(f"{self.term}_{self.next_version}", width))
            elif isinstance(self.term, ArrayRef):
                width = self.term.sort().range()
                Depth = self.term.sort().domain()
                self.term_stack_alias.append(Array(f"{self.term}_{self.next_version}", Depth, width))
            elif isinstance(self.term, BoolRef):
                self.term_stack_alias.append(Bool(f"{self.term}_{self.next_version}"))
            else:
                raise ValueError("Unsupported term type")
 
    @staticmethod
    def data_synchronization(clock): 
        # 确保位向量和数组两种表示形式的信号在符号执行过程中保持一致，避免混淆（大部分时间没用）
        for _,details in SMTSigCore._sigcore_list.items():
            if details.term_stack_alias:
                for i in range(clock+1):
                    term1 = details.term_stack[i]
                    term2 = details.term_stack_alias[i]
                    for j in range(term1.size()):
                        s.add(term2[j] == Extract(j, j, term1))
     
    @staticmethod
    def _set_wire_version(clock):
        for _,details in SMTSigCore._sigcore_list.items():
            if details.type == DATA_TYPE.INPUT or details.type == DATA_TYPE.WIRE:
                details.current_version = clock



    @staticmethod
    def _set_variable_version(clock):
        for _,details in SMTSigCore._sigcore_list.items():
                if details.type == DATA_TYPE.REG:
                    details.current_version = details.next_version
                    details.version_at_clock[clock] = details.next_version

    @staticmethod
    def _alignment_version_set(next_version,current_version):
        for _,details in SMTSigCore._sigcore_list.items():
            if details.type == DATA_TYPE.REG:
                details.current_version = current_version
                details.next_version = next_version
            if details.type == DATA_TYPE.INPUT or details.type == DATA_TYPE.WIRE:
                details.current_version = current_version
                details.next_version = next_version
  
class SMTParameter:
    _param_list = {}
    def __init__(self, expr):
        self.name = expr.name
        if "'b" in expr.value.var.value:
            self.value =  int(expr.value.var.value.split("'b")[1], 2)
        elif "'d" in expr.value.var.value:
            self.value = int(expr.value.var.value.split("'d")[1])
        elif "'h" in expr.value.var.value:
            self.value = int(expr.value.var.value.split("'h")[1], 16)
        elif "'o" in expr.value.var.value:
            self.value = int(expr.value.var.value.split("'o")[1], 8)
        else:
            self.value = int(expr.value.var.value)
        if self.value == 0:
            self.term = z3.BitVecVal(0, 1)
        else:
            self.term = z3.BitVecVal(self.value, ceil(math.log2(self.value)) + 1)
        SMTParameter._param_list[self.name] = self

class SMTProcess:
    current_process = None
    process_list = []
    def __init__(self, is_wired_block=False):
        self.is_edge_triggered = False
        self.entry_block = SMTBasicBlock(is_wired_block)
        self.exit_block = self.entry_block
        self.top_bb = self.entry_block

    def add_assign(self, assign):
        self.top_bb.assign_list.append(assign)
        assign.block = self.top_bb

    @staticmethod
    def make_circular():
        for process in SMTProcess.process_list:
            if process.entry_block != process.exit_block:
                if process.entry_block.predecessors.size() == 0:
                    process.entry_block.predecessors.add(process.exit_block)


class SMTBasicBlock:
    _block_counter = 0
    _block_list = []
    _assign_block_list = []
    _target_list = []
    _que_for_update_edge = []

    _total_target_num = 0


    _covered_target_list = []
    _uncovered_target_list = []

    def __init__(self, is_assign_block=False):
        self.id = SMTBasicBlock._block_counter
        SMTBasicBlock._block_counter += 1

        self.weight = 1
        self.distance = initial_distance

        self.idom = None
        self.is_edge_updated = False

        self.successors = set()
        self.predecessors = set()
    

        self.successors_id_list = []

        self.assign_list = []

        self.adjacency_list = {}
        self.closest_path = None
        self.closest_path_distance = 999
        self.closest_path_clock = 999

        self.iteration = 0
        self._block_list.append(self)
        if is_assign_block:
            self._assign_block_list.append(self)
        self.cnst_list = {'assign_id': [], 'cnst': []}
        self.dominate_list = []
    @staticmethod
    def add_target(target):
        SMTBasicBlock._target_list.append(target)

    @staticmethod
    def target_num():
        SMTBasicBlock._total_target_num = len(SMTBasicBlock._target_list)
        return SMTBasicBlock._total_target_num
    

    def print_adjacency_list(self):
          f_target_adjacency = open(folder_pth + "target_adjacency.txt", "w")
          for item in self._block_list:
                f_target_adjacency.write(f"Block {item.id} distance: {item.distance}." +
                    (f" Assign: {item.assign_list[0].id}." if item.assign_list else "") + "\n")
       


    def edge_realignment():

        for target in SMTBasicBlock._target_list:
            target.is_edge_updated = True
            SMTBasicBlock._que_for_update_edge.append(target)

        while SMTBasicBlock._que_for_update_edge:
            current = SMTBasicBlock._que_for_update_edge.pop(0)
            current._update_edge()


    def get_target_constraint(self):
        self.cnst_state = {}
        for assign_id, cnst in zip(self.cnst_list['assign_id'], self.cnst_list['cnst']):
            s.add(cnst)
        if s.check() == sat:
            m = s.model()  # Get the model from solver
            for d in m.decls():  # Iterate over all declarations
                if SMTSigCore._sigcore_list[d.name()].type == "reg":
                    if isinstance(m[d], ArrayRef):
                        for i in range(m[d].domain().size()):
                            self.cnst_state[d.name() + f"_[{i}]"] = simplify(m[d][i])
                    else:
                        self.cnst_state[d.name()] = m[d].as_long()
        else:
            SMTBasicBlock._uncovered_target_list.append(self)
            SMTBasicBlock._target_list.remove(self)
        s.reset()

    @staticmethod
    def get_targets_successors():
        for target in SMTBasicBlock._target_list:
            visited = []
            stack = [target]
            while stack:
                current_target = stack.pop()
              
                visited.append(current_target.id)
                if current_target.successors:
                    for successor in current_target.successors:
                        if successor.id in visited: 
                            continue
                        stack.append(successor)
                        target.successors_id_list.append(successor.id)

     

    @staticmethod
    def get_targets_constraints():
        for target in SMTBasicBlock._target_list:
            stack = [target]
            seen = set()
            while stack:
                current_target = stack.pop()
                if current_target in seen:
                    continue
                seen.add(current_target)
                if current_target.assign_list:
                    if current_target.assign_list[0].assign_type == SMTAssignType.SMT_ASSIGN_BRANCH:
                        target.dominate_list.append(current_target.assign_list[0])
                        if not isinstance(current_target.assign_list[0].lval.term, BoolRef) and isinstance(current_target.assign_list[0].rval.term, BoolRef):
                            target.cnst_list['assign_id'].append(current_target.assign_list[0].id)
                            target.cnst_list['cnst'].append(current_target.assign_list[0].lval.term == If(current_target.assign_list[0].rval.term, BitVecVal(1, 1), BitVecVal(0, 1)))
                        else:
                            target.cnst_list['assign_id'].append(current_target.assign_list[0].id)
                            target.cnst_list['cnst'].append(current_target.assign_list[0].lval.term == current_target.assign_list[0].rval.term)
                idom = current_target.idom
                if idom is None:
                    continue
                if idom not in seen:
                    stack.append(idom)
        if debug:
            SMTBasicBlock.print_target_constraints()
        for target in SMTBasicBlock._target_list:
            target.get_target_constraint()

    @staticmethod
    def get_targets_info():
        SMTBasicBlock.get_targets_successors()
        SMTBasicBlock.get_targets_constraints()
     


    @staticmethod
    def print_target_constraints():
        target_file = folder_pth + "target_constraints.txt"
        if os.path.exists(target_file):
            return
        else:
            f = open(target_file, "w")
            for target in SMTBasicBlock._target_list:
                f.write(f"Target {target.id} constraints:\n")
                for cnst in target.cnst_list:
                    f.write(f"{cnst}\n")
                f.write("\n")
            f.close()
     
    def print_all_targets_distance():
        f = open(folder_pth + "target_distance.txt", "w")
        for target in SMTBasicBlock._target_list:
            f.write(f"Target {target.id}, assign {target.assign_list[0].id}\n")
            for block in SMTBasicBlock._block_list:
                f.write(f"Block {block.id}, assign {block.assign_list[0].id if block.assign_list else None} distance from target: {target.adjacency_list[block.id]}\n")
            f.write("\n\n")

    def update_all_targets_distance():
        for target in SMTBasicBlock._target_list:
            target.update_target_distance()


    def update_target_distance(self):
        self.update_distance()
        for block in SMTBasicBlock._block_list:
            self.adjacency_list[block.id] = block.distance
 


    @staticmethod
    def reset_distance():
        for item in SMTBasicBlock._block_list:
            item.distance = initial_distance

    def update_distance(self):
        SMTBasicBlock.reset_distance()
        self.distance = 0
        bb_queue = []
        bb_queue.append(self)

        while bb_queue:
            top_bb = bb_queue[0]
            bb_queue.pop(0)
            
            current_distance = top_bb.distance
            updated = current_distance + top_bb.weight

            for predecessor in top_bb.predecessors:
                if updated < predecessor.distance:
                    predecessor.distance = updated
                    bb_queue.append(predecessor)

            if top_bb.idom and top_bb.idom.distance > updated:
                top_bb.idom.distance = current_distance + top_bb.weight
                bb_queue.append(top_bb.idom)



    @staticmethod
    def reset_distance():
        for item in SMTBasicBlock._block_list:
            item.distance = initial_distance    


    def _update_edge(self):
        if len(self.assign_list):
            if self.assign_list[0].assign_type == SMTAssignType.SMT_ASSIGN_BRANCH:
                br = self.assign_list[0]
                br._update_edge()
        else:
            if self.idom and (not self.idom.is_edge_updated):
                self.idom.is_edge_updated = True
                SMTBasicBlock._que_for_update_edge.append(self.idom)


    def update_all_closest_paths(path, constraints_stack):
        for target in SMTBasicBlock._target_list:
            target.update_closest_path(path, constraints_stack)

    def update_closest_path(self, path, constraints_stack):
        distance, clock = self.distance_from_current_path(constraints_stack)
        if distance < self.closest_path_distance or (distance == self.closest_path_distance and clock < self.closest_path_clock):
            self.closest_path_distance = distance
            self.closest_path_clock = clock
            self.closest_path = path

    def distance_from_current_path(self, constraints_stack):
        min_distance = 999
        min_clock = 999
        for item in constraints_stack:
            if item.obj:
                if item.obj.assign_type != SMTAssignType.SMT_ASSIGN:
                    distance = self.adjacency_list[item.obj.block.id]
                    if distance < min_distance or (distance == min_distance and item.clock < min_clock):
                        min_distance = distance
                        min_clock = item.clock
                    
        return min_distance, min_clock
    
    def remove_covered_targets():
        for i in range(len(SMTBasicBlock._target_list) - 1, -1, -1): 
            target = SMTBasicBlock._target_list[i]
            for assign in target.assign_list:
                if assign.covered_in_sim:
                    print(f"[COVERED] Removing target {target.id}")
                    SMTBasicBlock._covered_target_list.append(target)
                    SMTBasicBlock._target_list.pop(i)  
                    break  

    @staticmethod
    def extract_cfg():
        f_path = folder_pth + "cfg.txt"
        cfg = {}
        for block in SMTBasicBlock._block_list:
            cfg[block.id] = {}
            cfg[block.id]['predecessors'] = []
            cfg[block.id]['successors'] = []
            for successor in block.successors:
                cfg[block.id]['successors'].append(successor.id)
            for predecessor in block.predecessors:
                cfg[block.id]['predecessors'].append(predecessor.id)
            cfg[block.id]['assign_list'] = block.assign_list
            
        # print cfg to f_path
        with open(f_path, 'w') as f:
            for key, item in cfg.items():
                f.write(f"Block: {key}\n")
                f.write(f"Predecessors: {item['predecessors']}\n")
                f.write(f"Successors: {item['successors']}\n")
                f.write(f"Assignments:\n")
                for _assign in item['assign_list']:
                    f.write(f"[{_assign.id}]: ")
                    f.write(f"{str(_assign.lval.term)} = {str(_assign.rval.term)}\n")
                f.write("\n")
        return cfg
    
    def update_distance_from_adjacency_list(self):
        for item in SMTBasicBlock._block_list:
            item.distance = self.adjacency_list[item.id]


    @staticmethod
    def print_covered_result():

        print(f"[COVERED] Covered target number is {len(SMTBasicBlock._covered_target_list)}")
        print(f"[UNCOVERED] Uncovered target number is {len(SMTBasicBlock._uncovered_target_list)}")
        for target in SMTBasicBlock._covered_target_list:
            print(f"[COVERED] Covered target {target.id}", "Assign id: ", target.assign_list[0].id)
        for target in SMTBasicBlock._uncovered_target_list:
            print(f"[UNCOVERED] Uncovered target {target.id}", "Assign id: ", target.assign_list[0].id)
    


class SMTAssign:
    _assign_list = {}
    _blocking_list = []
    assign_counter = 0
    def __init__(self, clk_type = None, assign_type = None, lval = None, rval = None):
        self.id = SMTAssign.assign_counter
        SMTAssign.assign_counter += 1
        self.clk_type = clk_type
        self.assign_type = assign_type
        self.lval = lval
        self.rval = rval
        self.block = None
        self.covered_any_clock = False
        self.covered_in_sim = False
        self.process = SMTProcess.current_process
        self.blocking_variable = False
        SMTAssign._assign_list[self.id] = self

    def _init_assign(self, f, incr, wired_declared = False, assign  = False, blocking_variable = False):
        if blocking_variable:
            self.blocking_variable = True
            if str(self.lval.term) not in str(SMTAssign._blocking_list):
                SMTAssign._blocking_list.append(str(self.lval.term))
        self.instrument(f, incr, assign)
        if not wired_declared:
            SMTProcess.current_process.add_assign(self)
        if isinstance(self.lval, SMTConcat):
            for item in self.lval.expr_list:
                item.parent.assignment_list.append(self)
        else:
            self.lval.parent.assignment_list.append(self)
            

    def instrument(self, f, incr=0, assign = False):

        incr += 4
        space = " " * incr
        if not assign: 
            f.write(f"  $display(\";A {self.id}\");")
        str = f"  //assertion( {self.lval.term} = {self.rval.term}) {self.id}\n"
        lval_str = f"{self.lval.term} "
        if skip_assign(lval_str, reset_name):
            self._set_covered(0)
            return
     
        f.write(str)

    def _set_covered(self, clock):
        if self.covered_any_clock == False:
            self.covered_any_clock = True
            self.covered_in_sim = True
            self.covered_at_clock = clock

    def _update_term(self, CLKType_lval, CLKType_rval):
        if isinstance(self.rval, SMTBinary):
            rval = self.rval._eval_term(CLKType_rval, CLKType_rval)
        else:
            rval = self.rval._eval_term(CLKType_rval)

        if isinstance(self.lval, SMTBinary) :
            lval = self.lval._eval_term(CLKType_lval, CLKType_lval)
        else:
            lval = self.lval._eval_term(CLKType_lval)

        if type(lval) != list:
            lval , rval = align_width_term(lval, rval)       
            term = lval == rval
        else:
            term = (lval[1] == Store(lval[0], lval[2], rval))

        return term
    
    def _update_term_not_cond(self, CLKType_lval, CLKType_rval):
        if isinstance(self.rval, SMTBinary):
            rval = self.rval._eval_term(CLKType_rval, CLKType_rval)
        else:
            rval = self.rval._eval_term(CLKType_rval)

        if isinstance(self.lval, SMTBinary) :
            lval = self.lval._eval_term(CLKType_lval, CLKType_lval)
        else:
            lval = self.lval._eval_term(CLKType_lval)

        if type(lval) != list:
            lval , rval = align_width_term(lval, rval)       
            term = lval != rval
        else:
            term = (lval[1] != Store(lval[0], lval[2], rval))

        return term

    @staticmethod
    def get_assign_count():
        return SMTAssign.assign_counter
    
    @staticmethod
    def get_assign(id):
        return SMTAssign._assign_list[id]

class SMTBranchNode:
    def __init__(self):
        self.branch_list = []  #store the branch list, true branch and false branch
        self.cond = None
        self.cond_width = 0  # condition width



class SMTAssignStmt(SMTAssign):
    def __init__(self, f, lval, rval, incr = 0, wired_declared = False, assign = False):
        super().__init__(SMTCLKType.SMT_CLK_NEXT, SMTAssignType.SMT_ASSIGN, lval, rval)
        self._init_assign(f, incr, wired_declared, assign = assign)

    def _update_edge(self): 
        # only consider target condition
        rval = self._get_all_rval_signs()
        self.block.predecessors.clear()
        if rval is not None:
            for signal in rval:
                if isinstance(signal, list):
                    for item in signal:
                        if item and not isinstance(item,list) and item.assignment_list:
                            for assign in item.assignment_list:
                                self.block.predecessors.add(assign.block)
                                self.block.idom_list.add(assign.block.id)
                elif signal.assignment_list:
                    for assign in signal.assignment_list:
                        self.block.predecessors.add(assign.block)
                        self.block.idom_list.add(assign.block.id)
                     

    def _get_all_rval_signs(self):
        rval = self.rval.get_rval_signs()
        signal_list = []
        if isinstance(rval, list):
            for item in rval:
                if item and not isinstance(item, list) and item is not None:
                    signal_list.append(item)
                elif isinstance(item, list):
                    for signal in item:
                        if item is not None:
                            signal_list.append(signal)
        else:
            if rval:
                signal_list.append(rval)
        return signal_list
    
    
class SMTBranch(SMTAssign):
    _target_count = 0
    _all_branches_list = []
    def __init__(self, parent_node = None, branch_type = None, lval = None, rval = None):
        super().__init__(SMTCLKType.SMT_CLK_NEXT, SMTAssignType.SMT_ASSIGN_BRANCH, lval, rval)
        self.parent_node = parent_node
        self.branch_type = branch_type
        self.lval = lval
        self.rval = rval
        self.branch_probability = 0
        self.covered_at_clock = None
        self.branch_list = []
        self.parent_node.branch_list.append(self)
        SMTBranch._all_branches_list.append(self)

    def _serialize_term(self):
        lval = self.lval._serialize_term()
        rval = self.rval._serialize_term()
        # if type(self.parent_node.cond) != str:
        #     if type(self.parent_node.cond.term) == str:
        #         self.parent_node.cond = self.parent_node.cond.term
        #     else:
        #         self.parent_node.cond = self.parent_node.cond._serialize_term()
        self.parent_node.cond._serialize_term()
        return f"{rval} == {lval}"
    
    def _deserialize_term(self):
        self.lval.term = self.lval._deserialize_term()
        self.rval.term = self.rval._deserialize_term()
        if type(self.parent_node.cond.term) == str:
            self.parent_node.cond.term = self.parent_node.cond._deserialize_term()
        return self
    
    def instrument(self, f, incr=0):
        incr += 2
        space = " " * incr
        
        str = f"{space}//assertion( {self.lval.term} = {self.rval.term}) {self.id}\n"
        lval_str = f"{self.lval.term} "
        if skip_assign(lval_str, reset_name):
            self._set_covered(0)
            return
        f.write(f"{space}$display(\";A {self.id}\");")
        f.write(str)

    def _update_edge(self):
        '''
        Simple version implementation
        '''
        self.block.is_edge_updated = True
        
        # only consider target condition
        lval = self._get_all_lval_signs()
        # consider target condition and dominating condition
        # for i, cnst in enumerate(self.block.dominate_list):
        #     if i == 0:
        #         lval = cnst._get_all_lval_signs()
        #     else:
        #         lval = lval + cnst._get_all_lval_signs()
        if lval is not None:
            only_edge = True
            for signal in lval:
                if signal.assignment_list:
                    for assign in signal.assignment_list: #所有给signal赋值的assign
                        SMTSigCore.clear_all_versions()
                        s.reset()

                        # only consider target condition 某个赋值语句是否能使当前分支条件从不满足变为满足
                        not_cond = Not(self._update_term(SMTCLKType.SMT_CLK_CURR))  
                        SMTSigCore._alignment_version_set(0,0) 
                        before_assignment = Not(assign._update_term(SMTCLKType.SMT_CLK_CURR,SMTCLKType.SMT_CLK_CURR))
                        assignment = assign._update_term(SMTCLKType.SMT_CLK_NEXT,SMTCLKType.SMT_CLK_CURR) # 执行赋值语句
                        SMTSigCore._alignment_version_set(1,1)  
                        cond = self._update_term(SMTCLKType.SMT_CLK_CURR) 
                        combined_cond = z3.And(not_cond, before_assignment, assignment, cond)
                        s.add(combined_cond)
                        

                        # consider target condition and dominating condition
                        # for i, cnst in enumerate(self.block.dominate_list):
                        #     if i == 0:
                        #         not_cond = z3.Not(cnst._update_term(SMTCLKType.SMT_CLK_CURR))
                        #     else:
                        #         not_cond = z3.And(not_cond, z3.Not(cnst._update_term(SMTCLKType.SMT_CLK_CURR)))
                        # SMTSigCore._alignment_version_set(0,0) 
                        # assignment = assign._update_term(SMTCLKType.SMT_CLK_NEXT,SMTCLKType.SMT_CLK_CURR)
                        # SMTSigCore._alignment_version_set(1,1)  
                        # for i, cnst in enumerate(self.block.dominate_list):
                        #     if i == 0:
                        #         cond = cnst._update_term(SMTCLKType.SMT_CLK_CURR)
                        #     else:
                        #         cond = z3.And(cond, cnst._update_term(SMTCLKType.SMT_CLK_CURR))
                        # combined_cond = z3.And(not_cond, assignment, cond)
                        # s.add(simplify(combined_cond))

                        SMTSigCore.data_synchronization(1)

                        "Check the combined condition"
                        if debug:
                            if s.check() == sat:
                                print(f"[INFO] Checking the combined condition: {simplify(combined_cond)}")
                                print("[RESULT] SAT")
                            else:
                                print(f"[INFO] Checking the combined condition: {simplify(combined_cond)}")
                                print("[RESULT] UNSAT")

                        if s.check() == sat:
                            if only_edge: # 当前分支块首次发现前驱节点
                                only_edge = False
                                self.block.predecessors.clear()
                            if assign.block.id not in self.block.successors_id_list:
                                "Add the assign block to the successors of the current block"
                                self.block.predecessors.add(assign.block) #如果不在子节点列表中，则添加realignment的边，到父节点边
                            if not assign.block.is_edge_updated: #检测到新的未处理基本块时，将其添加到队列末尾
                                assign.block.is_edge_updated = True #标记避免多次入队
                                SMTBasicBlock._que_for_update_edge.append(assign.block) 
                        s.reset()

    

    def _get_state_variables(self, sigs):
        raise NotImplementedError("_get_state_variables")

    def _get_all_lval_signs(self):
        lval = self.lval.get_lval_signs()
        signal_list = []
        if isinstance(lval, list):
            for item in lval:
                if item:
                    signal_list.append(item)
        else:
            if lval:
                signal_list.append(lval)
        return signal_list
    
    @staticmethod
    def create_conditional_branch(parent, num_expr):
        smt_bool = SMTBool(num_expr)
        return SMTBranch(parent, SMTBranchType.SMT_BRANCH_IF, parent.cond, smt_bool)
    
    @staticmethod
    def create_true_branch(parent):
        branch = SMTBranch.create_conditional_branch(parent, '1')
        return branch
    
    @staticmethod
    def create_false_branch(parent):
        branch = SMTBranch.create_conditional_branch(parent, '0')
        return branch
    
    @staticmethod
    def create_case_branch(parent, case_expr):
        smt_bool = SMTBool('1')
        return SMTBranch(parent, SMTBranchType.SMT_BRANCH_CASE, case_expr, smt_bool)

    @staticmethod
    def create_default_branch(parent, stmt):
        smt_cust = SMTCust()
        smt_cust.parent = parent
        smt_cust.signal = parent.cond.signal

        for i in range(len(stmt.caselist)-1):
            if i == 0:
                val = NotEq(stmt.comp, stmt.caselist[i].cond[0])
            else:
                val = And(val, NotEq(stmt.comp, stmt.caselist[i].cond[0]))

        smt_cust.val = emit_expr(val)
        smt_cust.term = smt_cust.val.term

        smt_bool = SMTBool('1')
        return SMTBranch(parent, SMTBranchType.SMT_BRANCH_CASE,  smt_cust, smt_bool)


    @staticmethod
    def random_probability():
        sum = 0
        for branch in SMTBranch._all_branches_list:
            branch.branch_probability = random.random()
            sum += branch.branch_probability

        for branch in SMTBranch._all_branches_list:
            branch.branch_probability /= sum



    def _update_term(self, CLKType):
        if isinstance(self.rval, SMTBinary):
            current_rval = self.rval._eval_term(CLKType, CLKType)
        else:
            current_rval = self.rval._eval_term(CLKType)

        if isinstance(self.lval, SMTBinary):
            current_lval = self.lval._eval_term(CLKType, CLKType)
        else:
            current_lval = self.lval._eval_term(CLKType)
        
        current_rval, current_lval = align_width_term(current_rval, current_lval)
        current_rval = current_rval
        current_lval = current_lval
        return current_lval == current_rval



class SMTExpr:
    def __init__(self, SMTExprType):
        self.type = SMTExprType
        self.term = None
        self.signal = None

class SMTCust(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType = SMTExprType.SMT_EXPR_CUSTOM)

    def _eval_term(self, CLKType):
        #  replace the signal in the term with the current CLKType
        term = self.val._eval_term(CLKType, CLKType)
        return term


    def get_lval_signs(self):
        val = self.val.get_lval_signs()
        return val

     

class SMTSignal(SMTExpr):
    def __init__(self, signal):
        super().__init__(SMTExprType)
        if isinstance(signal, Pointer):
            if signal.var.name in SMTParameter._param_list:
                param = SMTParameter._param_list[signal.var.name]
                self.term = param.term
                self.signal = signal
                self.type = SMTExprType.SMT_EXPR_PARAM
                return
            self.parent = SMTSigCore._sigcore_list[signal.var.name]
        else:
            if signal.name in SMTParameter._param_list:
                param = SMTParameter._param_list[signal.name]
                self.term = param.term
                self.signal = signal
                self.type = SMTExprType.SMT_EXPR_PARAM
                return
            self.parent = SMTSigCore._sigcore_list[signal.name]
        self.type = SMTExprType.SMT_EXPR_IDENTIFIER
        self.term = self.parent.term
        self.signal = signal
        

        
    
    def get_lval_signs(self):
        if self.type == SMTExprType.SMT_EXPR_IDENTIFIER:
            return self.parent
    
    def _eval_term(self, CLKType):
        if self.type == SMTExprType.SMT_EXPR_IDENTIFIER:
            if CLKType == SMTCLKType.SMT_CLK_CURR:
                return self.parent.term_stack[self.parent.current_version]
            
            elif CLKType == SMTCLKType.SMT_CLK_LAST:
                if self.parent.type == DATA_TYPE.INPUT or self.parent.type == DATA_TYPE.WIRE:
                    return self.parent.term_stack[self.parent.current_version]
                else:
                    key = next(reversed(self.parent.version_at_clock))
                    value = self.parent.version_at_clock[key]
                    return self.parent.term_stack[value]
              
            elif CLKType == SMTCLKType.SMT_CLK_NEXT:
                self.parent._update_next_version()
                term = self.parent.term_stack[self.parent.next_version] 
                self.parent.current_version = self.parent.next_version
                return term
            
            else:
                raise ValueError("Unsupported clock type")

        elif self.type == SMTExprType.SMT_EXPR_PARAM:
            return self.term
        

class SMTPointer(SMTExpr):
    def __init__(self, signal):
        super().__init__(SMTExprType.SMT_EXPR_POINTER)
        self.parent = SMTSigCore._sigcore_list[signal.var.name]
        self.pointer = signal.ptr
        if isinstance(signal.ptr, Constant):
            self.pointer_parent = emit_constant(signal.ptr)
        else:
            self.parent.assign_term_alias(self.parent.term)
            self.pointer_parent = emit_expr(signal.ptr)



    def _eval_term(self, CLKType):
        # Curreny
        if CLKType == SMTCLKType.SMT_CLK_CURR:
            if isinstance(self.parent.term, BitVecRef):
                if isinstance(self.pointer, Constant):
                    return Extract(int(self.pointer.value), int(self.pointer.value), self.parent.term_stack[self.parent.current_version])   
                
                elif isinstance(self.pointer, Identifier):
                    var = self.parent.term_stack_alias[self.parent.current_version]
                    ptr = self.pointer_parent.parent.term_stack[self.pointer_parent.parent.current_version]
                    return var[ptr]
                    
                else:
                    raise ValueError("Unsupported pointer type")
                
            elif isinstance(self.parent.term, ArrayRef):
                if isinstance(self.pointer, Constant):
                    return self.parent.term_stack[self.parent.current_version][self.pointer.value]
                elif isinstance(self.pointer, Identifier):
                    var = self.parent.term_stack[self.parent.current_version]
                    ptr = self.pointer_parent.parent.term_stack[self.pointer_parent.parent.current_version]
                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                elif isinstance(self.pointer, binary_expr_map):
                    var = self.parent.term_stack[self.parent.current_version]
                    ptr = self.pointer_parent._eval_term(CLKType, CLKType)
                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                else:   
                    raise ValueError("Unsupported pointer type")
        # Last
        elif CLKType == SMTCLKType.SMT_CLK_LAST:
            # Parent is bitvec
            if isinstance(self.parent.term, BitVecRef):

                if isinstance(self.pointer, Constant):
                    if self.parent.type == DATA_TYPE.INPUT or self.parent.type == DATA_TYPE.WIRE:
                        return Extract(int(self.pointer.value), int(self.pointer.value), self.parent.term_stack[self.parent.current_version])
                    else:
                        key = next(reversed(self.parent.version_at_clock))
                        value = self.parent.version_at_clock[key]
                        return Extract(int(self.pointer.value), int(self.pointer.value), self.parent.term_stack[value])
                    
                elif isinstance(self.pointer, Identifier):
                    if self.parent.type == DATA_TYPE.INPUT or self.parent.type == DATA_TYPE.WIRE:
                      
                        ptr_key = next(reversed(self.pointer_parent.parent.version_at_clock))
                        ptr_value = self.pointer_parent.parent.version_at_clock[ptr_key]

                        var = self.parent.term_stack_alias[self.parent.current_version]
                        ptr = self.pointer_parent.parent.term_stack[ptr_value]
                        return var[ptr]
                    else:
                        var_key = next(reversed(self.parent.version_at_clock))
                        var_value = self.parent.version_at_clock[var_key]

                        ptr_key = next(reversed(self.pointer_parent.parent.version_at_clock))
                        ptr_value = self.pointer_parent.parent.version_at_clock[ptr_key]
                   
                        var = self.parent.term_stack_alias[var_value]
                        ptr = self.pointer_parent.parent.term_stack[ptr_value]
                        return var[ptr]
                  
                else:
                    raise ValueError("Unsupported pointer type")
                
            # Array is parent
            elif isinstance(self.parent.term, ArrayRef):
                if isinstance(self.pointer, Constant):
                    key = next(reversed(self.parent.version_at_clock))
                    value = self.parent.version_at_clock[key]
                    return self.parent.term_stack[value][self.pointer.value]
                
                elif isinstance(self.pointer, Identifier):
                    var_key = next(reversed(self.parent.version_at_clock))
                    var_value = self.parent.version_at_clock[var_key]

                    ptr_key = next(reversed(self.pointer_parent.parent.version_at_clock))
                    ptr_value = self.pointer_parent.parent.version_at_clock[ptr_key]

                
                    var = self.parent.term_stack[var_value]
                    ptr = self.pointer_parent.parent.term_stack[ptr_value]

                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                
                elif isinstance(self.pointer, binary_expr_map):
                    var_key = next(reversed(self.parent.version_at_clock))
                    var_value = self.parent.version_at_clock[var_key]
                    var = self.parent.term_stack[var_value]
                    ptr = self.pointer_parent._eval_term(CLKType, CLKType)
                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                
                else:
                    raise ValueError("Unsupported pointer type")
        #Next    
        else:
            if isinstance(self.parent.term, BitVecRef):
                if isinstance(self.pointer, Constant):
                    self.parent._update_next_version()
                    return Extract(int(self.pointer.value), int(self.pointer.value), self.parent.term_stack[self.parent.current_version])
                elif isinstance(self.pointer, Identifier):
                    self.parent._update_next_version()
                    self.pointer_parent.parent._update_next_version()
                    var = self.parent.term_stack_alias[self.parent.next_version]
                    ptr = self.pointer_parent.parent.term_stack[self.pointer_parent.parent.next_version]
                    return var[ptr]
                else:
                    raise ValueError("Unsupported pointer type")
                
            elif isinstance(self.parent.term, ArrayRef):
                if isinstance(self.pointer, Constant):
                    self.parent._update_next_version()
                    return self.parent.term_stack[self.parent.next_version][self.pointer.value]
                
                elif isinstance(self.pointer, Identifier):
                    self.parent._update_next_version()
                    self.pointer_parent.parent._update_next_version()
                    var = self.parent.term_stack[self.parent.next_version]
                    ptr = self.pointer_parent.parent.term_stack[self.pointer_parent.parent.next_version]
                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                
                elif isinstance(self.pointer, binary_expr_map):
                    self.parent._update_next_version()
                    var = self.parent.term_stack[self.parent.next_version]
                    ptr = self.pointer_parent._eval_term(CLKType, CLKType)
                    if ptr.size() > var.sort().domain().size():
                        ptr = Extract(var.sort().domain().size()-1, 0, ptr)
                    return var[ptr]
                else:
                    raise ValueError("Unsupported pointer type")

    def get_lval_signs(self):
        return self.parent



class SMTBranchStack:
    branch_stack = [] 

    @classmethod
    def push_to_branch_stack(cls, branch):
        """将SMTbranch对象推入栈"""
        cls.branch_stack.append(branch)

    @classmethod
    def pop_from_branch_stack(cls):
        """从栈中弹出SMTbranch对象"""
        if cls.branch_stack:
            return cls.branch_stack.pop()
        return None

    @classmethod
    def peek_branch_stack(cls):
        """查看栈顶元素但不弹出"""
        if cls.branch_stack:
            return cls.branch_stack[-1]
        return None
    
class SMTBool(SMTExpr):
    def __init__(self,num_expr = None):
        super().__init__(SMTExprType= SMTExprType.SMT_EXPR_CONSTANT)
        if num_expr == '1':
            self.signal = 'true'
            self.term = z3.BoolVal(True)
        elif num_expr == '0':
            self.signal = 'false'
            self.term = z3.BoolVal(False)

    def _eval_term(self, CLKType):
        return self.term
    
    def get_lval_signs(self):
        return

class SMTNumber(SMTExpr):
    def __init__(self,expr):
        super().__init__(SMTExprType= SMTExprType.SMT_EXPR_CONSTANT)
        self.signal = expr
        literal = expr.value
        self.signed = False

        
        if "'s" in literal:
            self.signed = True
            literal = literal.replace("'s", "'")

        if "'b" in literal:
            width_part, value_part = literal.split("'b")
            self.width = int(width_part) if width_part else 1
            if 'x' in value_part:
                value_part = value_part.replace('x','0')
            elif 'z' in value_part:
                value_part = value_part.replace('z','0')
            self.value = int(value_part, 2)
        elif "'h" in literal:
            width_part, value_part = literal.split("'h")
            self.width = int(width_part) if width_part else 1
            self.value = int(value_part, 16)
        elif "'o" in literal:
            width_part, value_part = literal.split("'o")
            self.width = int(width_part) if width_part else 1
            self.value = int(value_part, 8)
        elif "'d" in literal:
            width_part, value_part = literal.split("'d")
            self.width = int(width_part) if width_part else 1
            self.value = int(value_part, 10)
        else:
            self.width = len(bin(int(literal)))-2
            self.value = int(literal)
 
        if self.signed:
            self.term = BitVecVal(self.value, self.width)
        else:
            self.term = BitVecVal(self.value, self.width)


    def _eval_term(self, CLKType):
     
        return self.term
    
    def get_lval_signs(self):
        return 
     

class SMTBinary(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_BINARY)
        self.opcode = "invalid"
        self.func = None
        self.is_signed = False
        self.lval = None
        self.rval = None

   
    def get_lval_signs(self):
        signal = []
        if isinstance(self, SMTBinary):
            lval = self.lval.get_lval_signs()
            rval = self.rval.get_lval_signs()
            if isinstance(lval, list):
                for item in lval:
                    signal.append(item)
            else:
                signal.append(lval)
            if isinstance(rval, list):
                for item in rval:
                    signal.append(item)
            else:
                signal.append(rval)
            return signal
        elif isinstance(self, SMTSignal):
            return self.parent
        else:
            raise ValueError("Unsupported lval type")
        

    def _eval_term(self, CLKType_lval, CLKType_rval):
        # 如果branch中的是阻塞变量，那么用当前version的值而不是上一个version的值
        if str(self.lval.signal) in SMTAssign._blocking_list and CLKType_lval == SMTCLKType.SMT_CLK_LAST:
            CLKType_lval = SMTCLKType.SMT_CLK_CURR
        if str(self.rval.signal) in SMTAssign._blocking_list and CLKType_rval == SMTCLKType.SMT_CLK_LAST:
            CLKType_rval = SMTCLKType.SMT_CLK_CURR

        if isinstance(self.rval, SMTBinary):
            rval = self.rval._eval_term(CLKType_rval, CLKType_rval)
        else:
            rval = self.rval._eval_term(CLKType_rval)
        if isinstance(self.lval, SMTBinary) :
            lval = self.lval._eval_term(CLKType_lval, CLKType_lval)
        else:
            lval = self.lval._eval_term(CLKType_lval)




        if self.opcode == "eq":
            lval, rval = align_width_term(lval, rval)
            return (lval == rval)
        
        elif self.opcode == "ne":
            lval, rval = align_width_term(lval, rval)
            return (lval != rval)
        
        elif self.opcode == "lor":
            lval, rval = align_width_term(lval, rval)
            return z3.Or(lval == True, rval == True)
        
        elif self.opcode == "land":
            lval, rval = align_width_term(lval, rval)
            return z3.And(lval == True, rval == True)
        
        elif self.opcode == "or":
            lval, rval = align_width_term(lval, rval)
            return (lval | rval)
        
        elif self.opcode == "xor":
            lval, rval = align_width_term(lval, rval)
            return (lval ^ rval)
        
        elif self.opcode == "ult":
            lval, rval = align_width_term(lval, rval)
            return ULT(lval, rval)
        
        elif self.opcode == "ule":
            lval, rval = align_width_term(lval, rval)
            return ULE(lval, rval)
        
        elif self.opcode == "ugt":
            lval, rval = align_width_term(lval, rval)
            return UGT(lval, rval)
        
        elif self.opcode == "uge":
            lval, rval = align_width_term(lval, rval)
            return UGE(lval, rval)
        
        elif self.opcode == "urem":
            lval, rval = align_width_term(lval, rval)
            return URem(lval, rval)
        
        elif self.opcode == "rem":
            lval, rval = align_width_term(lval, rval)
            return (lval % rval)
        
        elif self.opcode == "lt":
            lval, rval = align_width_term(lval, rval)
            return (lval < rval)
        
        elif self.opcode == "le":
            lval, rval = align_width_term(lval, rval)
            return (lval <= rval)
        
        elif self.opcode == "gt":
            lval, rval = align_width_term(lval, rval)
            return (lval > rval)
        
        elif self.opcode == "ge":
            lval, rval = align_width_term(lval, rval)
            return (lval >= rval)
        
        elif self.opcode == "add":
            lval, rval = align_width_term(lval, rval)
            return (lval + rval)
        
        elif self.opcode == "sub":
            lval, rval = align_width_term(lval, rval)
            return (lval - rval)
        
        elif self.opcode == "mul":
            lval, rval = align_width_term(lval, rval)
            return (lval * rval)
        
        elif self.opcode == "div":
            lval, rval = align_width_term(lval, rval)
            return (lval / rval)
                
        elif self.opcode == "and":
            lval, rval = align_width_term(lval, rval)
            return (lval & rval)
        
        elif self.opcode == "xnor":
            lval, rval = align_width_term(lval, rval)
            return ~(lval ^ rval)
        
        elif self.opcode == "udiv":
            lval, rval = align_width_term(lval, rval)
            return UDiv(lval, rval)
        
        elif self.opcode == "lshr":   
            lval, rval = align_width_term(lval, rval) 
            return LShR(lval, rval)
        
        elif self.opcode == "sll":
            lval, rval = align_width_term_for_shift(lval, rval)
            return (lval << rval)
     

        elif self.opcode == "srl":
            lval, rval = align_width_term_for_shift(lval, rval)
            return (lval >> rval)
        
        elif self.opcode == "pow":
            lval, rval = align_width_term(lval, rval)
            return bv_pow(lval, rval)
        
        elif self.opcode == "sra":
            # DANGEROUS: Maybe BUG here
            lval, rval = align_width_term(lval, rval)
            return arithmetic_shift_right(lval, rval)

        else:
            raise ValueError(f"Unsupported opcode {self.opcode}")
            
class SMTConcat(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_CONCAT)
        self.expr_list = None
        self.term = None

    def _eval_term(self, CLKType):
        def evaluate_and_convert(expr):
            # 先判断是不是SMTBinary类型，这决定了_eval_term的参数
            if isinstance(expr, SMTBinary):
                temp_term = expr._eval_term(CLKType, CLKType)
            else:
                temp_term = expr._eval_term(CLKType)
            
            # 如果结果是BoolRef，转换成BitVecVal
            if isinstance(temp_term, BoolRef):
                return If(temp_term, BitVecVal(1, 1), BitVecVal(0, 1))
            return temp_term

        terms = [evaluate_and_convert(expr) for expr in self.expr_list]
        return z3.Concat(*terms) if terms else None

    
    def get_lval_signs(self):
        signals = []
        for item in self.expr_list:
            if isinstance(item, SMTBinary):
                lval = item.get_lval_signs()
                if isinstance(lval, list):
                    for signal in lval:
                        signals.append(signal)
                else:
                    signals.append(lval)
            elif isinstance(item, SMTSignal):
                signals.append(item.parent)
            elif isinstance(item, SMTPartselect):
                signals.append(item.parent)
            elif isinstance(item, SMTNumber):
                pass
            elif isinstance(item, SMTUnary):
                signals.append(item.get_lval_signs())
            elif isinstance(item, SMTPointer):
                signals.append(item.get_lval_signs())
            else:
                raise ValueError("Unsupported item type")
        return signals


class SMTUnary(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_UNARY)
        self.opcode = "invalid"
        self.func = None
        self.val = None

    def get_lval_signs(self):
        if isinstance(self.val, SMTBinary):
            return self.val.get_lval_signs()
        elif isinstance(self.val, SMTSignal):
            return self.val.parent
        elif isinstance(self.val, SMTUnary):
            return self.val.get_lval_signs()
        elif isinstance(self.val, SMTConcat):
            return self.val.get_lval_signs()
        elif isinstance(self.val, SMTPartselect):
            return self.val.get_lval_signs()
        elif isinstance(self.val, SMTPointer):
            return self.val.get_lval_signs()
        else:
            raise ValueError("Unsupported val type")
    
    def _eval_term(self, CLKType):
        if self.opcode == "Ulnot":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return (val == False)
        
        elif self.opcode == "Unot":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return ~val
        
        elif self.opcode == "Uplus":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return val
        elif self.opcode == "Uminus":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return -val
        elif self.opcode == "Uor":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return BVRedOr(val)
        elif self.opcode == "Uand":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return BVRedAnd(val)
        elif self.opcode == "Unor":
            if isinstance(self.val, SMTBinary) :
                val = self.val._eval_term(CLKType, CLKType)
            else:
                val = self.val._eval_term(CLKType)
            return ~BVRedOr(val)
        
        else:
            raise ValueError("Unsupported opcode")

class SMTPartselect(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_PART_SELECT)
        self.signal= None
        self.val = None
        self.msb = None
        self.lsb = None
        self.term = None
        self.parent = None

    def _eval_term(self, CLKType):
        if isinstance(self.val, SMTBinary):
            val = self.val._eval_term(CLKType, CLKType)
        else:
            val = self.val._eval_term(CLKType)
        term = Extract(int(self.msb), int(self.lsb), val)
        return term

    def get_lval_signs(self):
        return self.val.get_lval_signs()



class SMTNonBlockingAssign(SMTAssign):
    def __init__(self, f, lval, rval, incr = 0):
        super().__init__(SMTCLKType.SMT_CLK_NEXT, SMTAssignType.SMT_ASSIGN_NON_BLOCKING, lval, rval)
        self._init_assign(f, incr)

class SMTBlockingAssign(SMTAssign):
    def __init__(self, f, lval, rval, incr = 0):
        super().__init__(SMTCLKType.SMT_CLK_NEXT, SMTAssignType.SMT_ASSIGN_BLOCKING, lval, rval)
        self._init_assign(f, incr, blocking_variable = True)
    
class SMTCond(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_COND)
        self.cond = None
        self.true_expr = None
        self.false_expr = None
        self.term = None
        self.signal = None
    
    def _eval_term(self, CLKType):
        if isinstance(self.cond, SMTBinary):
            cond = self.cond._eval_term(CLKType, CLKType)
        else:
            cond = self.cond._eval_term(CLKType)
        if isinstance(self.true_expr, SMTBinary):
            true_expr = self.true_expr._eval_term(CLKType, CLKType)
        else:
            true_expr = self.true_expr._eval_term(CLKType)
        if isinstance(self.false_expr, SMTBinary):
            false_expr = self.false_expr._eval_term(CLKType, CLKType)
        else:
            false_expr = self.false_expr._eval_term(CLKType)
        if isinstance(cond, BoolRef):
            pass
        else:
             cond = cond == BitVecVal(1, cond.size())
        if isinstance(true_expr, BoolRef):
            true_expr = If(true_expr, BitVecVal(1,1), BitVecVal(0,1))
        if isinstance(false_expr, BoolRef):
            false_expr = If(false_expr, BitVecVal(1,1), BitVecVal(0,1))
        true_expr, false_expr = align_width_term(true_expr, false_expr)
        term = If(cond == True, true_expr, false_expr)
        return term

    def get_lval_signs(self):
        # return lval_signs of true_expr and false_expr
        # if more than one, make them list
        lval_true = self.true_expr.get_lval_signs()
        lval_false = self.false_expr.get_lval_signs()
        if isinstance(lval_true, list):
            if lval_false and isinstance(lval_false, list):
                for item in lval_false:
                    lval_true.append(item)
            return lval_true
        else:
            return lval_true
        
def emit_expr(expr):
    # Binary expression
    if isinstance(expr, binary_expr_map):
        return emit_binary_expr(expr)
    # Unary expression
    elif isinstance(expr, unary_expr_map):
        return emit_unary_expr(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Identifier):
        return emit_identifier(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Constant):
        return emit_constant(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Concat) or isinstance(expr, pyverilog.vparser.ast.LConcat):
        return emit_concat(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Partselect):
        return emit_partselect(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Cond):
        return emit_ternary(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Pointer):
        return emit_pointer(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Repeat):
        return emit_repeat(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Parameter):
        return emit_parameter(expr)
    else:
        raise ValueError(f"Unsupported expression type: {type(expr)}")
   
class SMTRepeat(SMTExpr):
    def __init__(self):
        super().__init__(SMTExprType=SMTExprType.SMT_EXPR_REPEAT)
        self.val = None
        self.times = None
        self.term = None
        self.signal = None

    def _eval_term(self, CLKType):
        for i in range(self.times):
            if i == 0:
                if isinstance(self.val, SMTBinary):
                    term = self.val._eval_term(CLKType, CLKType)
                else:
                    term = self.val._eval_term(CLKType)
            else:
                if isinstance(self.val, SMTBinary):
                    term = z3.Concat(term, self.val._eval_term(CLKType, CLKType))
                else:
                    term = z3.Concat(term, self.val._eval_term(CLKType))
        return term

    def get_lval_signs(self):
        return self.expr.get_lval_signs()

def emit_repeat(expr):
    smt_repeat = SMTRepeat()
    smt_repeat.times = int(expr.times.value)
    if len(expr.value.list) == 1:
        pass
    else:
        raise ValueError("Unsupported repeat expression")
    
    smt_repeat.val = emit_expr(expr.value.list[0])

    for i in range(smt_repeat.times):
        if i == 0:
            smt_repeat.term = smt_repeat.val.term
        else:
            smt_repeat.term = z3.Concat(smt_repeat.term, smt_repeat.val.term)
    smt_repeat.signal = f"{{ {smt_repeat.times}{{ {smt_repeat.val.signal} }} }}"

    return smt_repeat

def emit_cond_expr(expr):
    # Binary expression
    if isinstance(expr, binary_expr_map):
        return emit_binary_expr(expr)
    # Unary expression
    elif isinstance(expr, unary_expr_map):
        return emit_unary_expr(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Identifier):
        return emit_cond_identifier(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Constant):
        return emit_constant(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Concat):
        return emit_concat(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Partselect):
        return emit_partselect(expr)
    elif isinstance(expr, pyverilog.vparser.ast.Pointer):
        return emit_pointer(expr) 
    elif isinstance(expr, pyverilog.vparser.ast.Cond):
        return emit_ternary(expr)
    else:
        raise ValueError(f"Unsupported expression type: {type(expr)}")

def emit_ternary(expr):
    smt_cond = SMTCond()
    smt_cond.cond = emit_cond_expr(expr.cond)
    smt_cond.true_expr = emit_expr(expr.true_value) 
    smt_cond.false_expr = emit_expr(expr.false_value)
    if  isinstance(smt_cond.cond.term, BoolRef):
        pass
    else:
        smt_cond.cond.term = smt_cond.cond.term == BitVecVal(1, smt_cond.cond.term.size())
    if isinstance(smt_cond.true_expr.term, BoolRef):
        smt_cond.true_expr.term = If(smt_cond.true_expr.term == True, BitVecVal(1,1), BitVecVal(0,1))
    if isinstance(smt_cond.false_expr.term, BoolRef):
        smt_cond.false_expr.term = If(smt_cond.false_expr.term == True, BitVecVal(1,1), BitVecVal(0,1))
    smt_cond.true_expr.term, smt_cond.false_expr.term = align_width_term(smt_cond.true_expr.term, smt_cond.false_expr.term)
    smt_cond.term = If(smt_cond.cond.term == True, smt_cond.true_expr.term, smt_cond.false_expr.term)
    smt_cond.signal = f"{smt_cond.cond.signal} ? {smt_cond.true_expr.signal} : {smt_cond.false_expr.signal}"
    return smt_cond

def emit_binary_expr(expr):
    smt_binary = SMTBinary()

    rval = emit_expr(expr.right)
    lval = emit_expr(expr.left)


    smt_binary.lval = lval
    smt_binary.rval = rval

    smt_binary.func = expr.__class__.__name__

 

    smt_binary.is_signed = False
    if hasattr(lval, 'parent'):
        smt_binary.is_signed = lval.parent.is_signed
    elif hasattr(rval, 'parent'):
        smt_binary.is_signed = rval.parent.is_signed
   
    if isinstance(expr, ast_Eq):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "eq"
        smt_binary.term = (lval.term == rval.term)
        smt_binary.signal = f"({lval.signal} == {rval.signal})"

    elif isinstance(expr, ast_NotEq):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "ne"
        smt_binary.term = (lval.term != rval.term)
        smt_binary.signal = f"({lval.signal} != {rval.signal})"
        
    elif isinstance(expr, ast_Lor):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "lor"
        smt_binary.term = z3.Or(lval.term == True, rval.term == True)
        smt_binary.signal = f"({lval.signal} || {rval.signal})"

    elif isinstance(expr, ast_Land):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "land"
        smt_binary.term = z3.And(lval.term == True, rval.term == True)
        smt_binary.signal = f"({lval.signal} && {rval.signal})"

    elif isinstance(expr, ast_Or):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "or"
        smt_binary.term = (lval.term | rval.term)
        smt_binary.signal = f"({lval.signal} | {rval.signal})"

    elif isinstance(expr, ast_Xor):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "xor"
        smt_binary.term = (lval.term ^ rval.term)
        smt_binary.signal = f"({lval.signal} ^ {rval.signal})"
        
    elif isinstance(expr, ast_LessThan):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "lt"
            smt_binary.term = (lval.term < rval.term)
        else:
            smt_binary.opcode = "ult"
            smt_binary.term = ULT(lval.term, rval.term)
            
        smt_binary.signal = f"({lval.signal} < {rval.signal})"

    elif isinstance(expr, ast_LessEq):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "le"
            smt_binary.term = (lval.term <= rval.term)
        else:
            smt_binary.opcode = "ule"
            smt_binary.term = ULE(lval.term, rval.term)
          
        smt_binary.signal = f"({lval.signal} <= {rval.signal})"

    elif isinstance(expr, ast_GreaterThan):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "gt"
            smt_binary.term = (lval.term > rval.term)
        else:
            smt_binary.opcode = "ugt"
            smt_binary.term = UGT(lval.term, rval.term)
          
        smt_binary.signal = f"({lval.signal} > {rval.signal})"

    elif isinstance(expr, ast_GreaterEq):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "ge"
            smt_binary.term = (lval.term >= rval.term)
        else:
            smt_binary.opcode = "uge"
            smt_binary.term = UGE(lval.term, rval.term)
         
        smt_binary.signal = f"({lval.signal} >= {rval.signal})"

    elif isinstance(expr, ast_Plus):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "add"
        smt_binary.term = (lval.term + rval.term)
        smt_binary.signal = f"({lval.signal} + {rval.signal})"

    elif isinstance(expr, ast_Minus):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "sub"
        smt_binary.term = (lval.term - rval.term)
        smt_binary.signal = f"({lval.signal} - {rval.signal})"

    elif isinstance(expr, ast_Times):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "mul"
        smt_binary.term = (lval.term * rval.term)
        smt_binary.signal = f"({lval.signal} * {rval.signal})"

    elif isinstance(expr, ast_Divide):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "div"
            smt_binary.term = (lval.term / rval.term)
        else:
            smt_binary.opcode = "udiv"
            smt_binary.term = UDiv(lval.term, rval.term)
           
        smt_binary.signal = f"({lval.signal} / {rval.signal})"

    elif isinstance(expr, ast_Mod):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "rem"
            smt_binary.term = (lval.term % rval.term)
        else:
            smt_binary.opcode = "urem"
            smt_binary.term = URem(lval.term, rval.term)
         
        # smt_binary.term = Extract(rval_term-1, 0, smt_binary.term)
        smt_binary.signal = f"({lval.signal} % {rval.signal})"

    elif isinstance(expr, ast_Sll):
        lval.term, rval.term = align_width_term_for_shift(lval.term, rval.term)
        smt_binary.opcode = "sll"
        smt_binary.term = (lval.term << rval.term)
        # smt_binary.term = simplify(ZeroExt(rval.term.as_long),Extract(lval.width-1,0,lval.term)) << rval.term.as_long()
        smt_binary.signal = f"({lval.signal} << {rval.signal})"


    elif isinstance(expr, ast_Srl):
        lval.term, rval.term = align_width_term_for_shift(lval.term, rval.term)
        if smt_binary.is_signed:
            smt_binary.opcode = "srl"
            smt_binary.term = (lval.term >> rval.term)
        else:
            smt_binary.opcode = "lshr"
            smt_binary.term = LShR(lval.term, rval.term)
           
        smt_binary.signal = f"({lval.signal} >> {rval.signal})"

    
    elif isinstance(expr, ast_Sra):
        # DANGEROUS: Maybe BUG here
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "sra"
        smt_binary.term = arithmetic_shift_right(lval.term, rval.term)
        # smt_binary.term = (lval.term >> rval.term)
        smt_binary.signal = f"({lval.signal} >>> {rval.signal})"

    elif isinstance(expr, ast_Power): 
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "pow"
        smt_binary.term = bv_pow(lval.term, rval.term)
        smt_binary.signal = f"({lval.signal} ** {rval.signal})"

    elif isinstance(expr, ast_And):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "and"
        smt_binary.term = (lval.term  & rval.term )
        smt_binary.signal = f"({lval.signal} & {rval.signal})"

    elif isinstance(expr, ast_Xnor):
        lval.term, rval.term = align_width_term(lval.term, rval.term)
        smt_binary.opcode = "xnor"
        smt_binary.term = ~(lval.term ^ rval.term)
        smt_binary.signal = f"({lval.signal} ^ {rval.signal})"

    else:
        raise ValueError(f"Unsupported binary expression: {expr}")

    return smt_binary

def emit_partselect(expr):
    smt_partselect = SMTPartselect()
    smt_partselect.msb = get_params(expr.msb)
    smt_partselect.lsb = get_params(expr.lsb)
    smt_partselect.val = emit_expr(expr.var)
    if expr.var.attr_names != ():
        smt_partselect.parent = SMTSigCore._sigcore_list[expr.var.name]
        if isinstance(smt_partselect.val.term, BitVecRef):
            smt_partselect.term = Extract(smt_partselect.msb, smt_partselect.lsb, smt_partselect.val.term)
        else:
            raise ValueError(f"Unsupported partselect expression: {expr}")
        smt_partselect.signal = f"{expr.var}[{smt_partselect.msb}:{smt_partselect.lsb}]"
    else:
        smt_partselect.parent = SMTSigCore._sigcore_list[expr.var.var.name]
        if isinstance(smt_partselect.val.term, BitVecRef):
            smt_partselect.term = Extract(smt_partselect.msb, smt_partselect.lsb, smt_partselect.val.term)
        else:
            raise ValueError(f"Unsupported partselect expression: {expr}")
        smt_partselect.signal = f"{expr.var.var}[{expr.var.ptr}][{smt_partselect.msb}:{smt_partselect.lsb}]"
    return smt_partselect

def emit_unary_expr(expr):
    smt_unary = SMTUnary()
    opera = emit_expr(expr.right)
    smt_unary.val = opera
    smt_unary.func = expr.__class__.__name__
    if isinstance(expr, ast_Ulnot):
        smt_unary.opcode = "Ulnot"
        smt_unary.term = Not(opera.term == True)
        smt_unary.signal = f"(~{opera.signal})"


    elif isinstance(expr, ast_Unot):
        smt_unary.opcode = "Unot"
        smt_unary.term = ~opera.term
        smt_unary.signal = f"(~{opera.signal})"


    elif isinstance(expr, ast_Uplus):
        smt_unary.opcode = "Uplus"
        smt_unary.term = opera.term
        smt_unary.signal = f"(+{opera.signal})"

    elif isinstance(expr, ast_Uminus):
        smt_unary.opcode = "Uminus"
        smt_unary.term = -opera.term
        smt_unary.signal = f"-{opera.signal}"
    
    elif isinstance(expr, ast_Unor):
        smt_unary.opcode = "Unor"
        smt_unary.term = ~BVRedOr(opera.term)
        smt_unary.signal = f"~|{opera.signal}"

    elif isinstance(expr, ast_Uor):
        smt_unary.opcode = "Uor"
        smt_unary.term = BVRedOr(opera.term)
        smt_unary.signal = f"(|{opera.signal})"

    elif isinstance(expr, ast_Uand):
        smt_unary.opcode = "Uand"
        smt_unary.term = BVRedAnd(opera.term)
        smt_unary.signal = f"(&{opera.signal})"

    elif isinstance(expr, ast_Uxor):
        smt_unary.opcode = "Uxor"
        smt_unary.term = reduce_xor(opera.term)
        smt_unary.signal = f"(^{opera.signal})"
        
    else:
        raise ValueError(f"Unsupported unary expression: {expr}")
    
    return smt_unary

# 定义一个辅助函数来执行归约异或操作
def reduce_xor(bv):
    size = bv.size()
    if size == 1:
        return bv
    result = Extract(0, 0, bv)  # 取最低位
    for i in range(1, size):
        result = result ^ Extract(i, i, bv)  # 对每一位进行异或操作
    return result

def emit_identifier(expr):
    smt_signal = SMTSignal(expr)
    return smt_signal

def emit_constant(expr):
    return SMTNumber(expr)

def emit_parameter(expr):
    smt_parameter = SMTParameter(expr)
    return smt_parameter

def emit_pointer(expr):
    """
    Handle both vector and array pointers.
    """
    smt_pointer = SMTPointer(expr)
    opera_var = SMTSigCore._sigcore_list[expr.var.name].term

    if isinstance(opera_var, ArrayRef):
        opera_var_depth = opera_var.sort().domain()
    else:
        opera_var_depth = opera_var.size()
    

    if isinstance(opera_var, BitVecRef):
        smt_pointer.signal = f"{expr.var.name}[{smt_pointer.pointer_parent.signal}]"

        if isinstance(expr.ptr, Constant):
            smt_pointer.term = Extract(int(expr.ptr.value), int(expr.ptr.value), opera_var)
        else:
            smt_pointer.term = Select(smt_pointer.parent.term_alias, smt_pointer.pointer_parent.term)
            
    elif isinstance(opera_var, ArrayRef):
        smt_pointer.signal = f"{expr.var.name}[{smt_pointer.pointer_parent.signal}]"

        if isinstance(expr.ptr, Constant):
            opera_ptr = BitVecVal(int(expr.ptr.value), opera_var_depth)
            smt_pointer.term = Select(opera_var, opera_ptr)

        else:
            if opera_var_depth.size() < smt_pointer.pointer_parent.term.sort().size():
                smt_pointer.pointer_parent.term = Extract(opera_var_depth.size()-1, 0, smt_pointer.pointer_parent.term)
            elif opera_var_depth.size() > smt_pointer.pointer_parent.term.sort().size():
                smt_pointer.pointer_parent.term = ZeroExt(opera_var.sort().size()-opera_var_depth.size(), smt_pointer.pointer_parent.term)
            smt_pointer.term = Select(opera_var, smt_pointer.pointer_parent.term)

    else:
        raise ValueError(f"Unsupported pointer type: {type(expr)}")
    
    return smt_pointer



def emit_concat(expr):
    smt_concat = SMTConcat()
    expr_list = [emit_expr(item) for item in expr.list]
    smt_concat.expr_list = expr_list

    if not expr_list:
        raise ValueError("expr_list is empty, unable to concatenate signals")

    # if not all(isinstance(item, (SMTSignal, SMTNumber)) for item in expr_list):
    #     raise ValueError("All items in expr_list must be of type SMTSignal or SMTNumber")
    
    smt_concat.signal = "{" + ", ".join(str(item.signal) for item in expr_list) + "}"
    for item in expr_list:
        if isinstance(item.term, BoolRef):
            item.term = If(item.term == True, BitVecVal(1, 1), BitVecVal(0, 1))
    smt_concat.term = z3.Concat([item.term for item in expr_list])
    return smt_concat

def log2ceil(x):
    if x == 0:
        return 1
    else:
        res = int(math.ceil(math.log2(x)))+1
    return res

def align_width_term_for_shift(lval, rval):
    # Xiangchen: This function is used to align the width of two terms for shift operation.
    # Notice: This function needs to consider the lval value and width espicailly.
    max_width = 0
    if isinstance(lval, BitVecNumRef):
        lval_width = log2ceil(int(lval.params()[0]))
        lval = BitVecVal(lval.params()[0], lval_width)
    elif isinstance(lval, BitVecRef):
        lval_width = lval.size()
        
    else:
        raise ValueError(f"Unsupported type: {type(lval)}")

    if isinstance(rval, BitVecNumRef):
        rval_width = int(rval.params()[0])
        rval = BitVecVal(rval.params()[0], rval_width)
    elif isinstance(rval, BitVecRef):
        rval_width = rval.size()
    else:
        raise ValueError(f"Unsupported type: {type(rval)}")
    
    max_width = lval_width+rval_width
    
    if lval_width < max_width:
        lval = ZeroExt(max_width - lval_width, lval)
    elif lval_width > max_width:
        lval = Extract(max_width-1, 0, lval)
    
    rval_width = rval.size()
    if rval_width < max_width:
        rval = ZeroExt(max_width - rval_width, rval)
    elif rval_width > max_width:
        rval = Extract(max_width-1, 0, rval)
        
    return lval, rval
    
    


def align_width_term(lval, rval):
    
    if isinstance(lval, BitVecNumRef) or isinstance(lval, BitVecRef):
        lval_width = lval.size()
    elif isinstance(lval, ArrayRef):
        lval_width = lval.sort().range().size()
    elif isinstance(lval, BoolRef):
        lval = If(lval == True, BitVecVal(1, 1), BitVecVal(0, 1))
        lval_width = 1
    elif isinstance(lval, Concat) or lval is None:
        return lval, rval
    else:
        raise ValueError(f"Unsupported type: {type(lval)}")

    if isinstance(rval, BitVecNumRef) or isinstance(rval, BitVecRef):
        rval_width = rval.size()
    elif isinstance(rval, ArrayRef):
        rval_width = rval.sort().range().size()
    elif isinstance(rval, BoolRef):
        rval = If(rval == True, BitVecVal(1, 1), BitVecVal(0, 1))
        rval_width = 1
    elif isinstance(rval, Concat) or rval is None:
        return lval, rval
    else:
        raise ValueError(f"Unsupported type: {type(rval)}")

    max_width = max(lval_width, rval_width)

    if lval_width < max_width:
        lval = ZeroExt(max_width - lval_width, lval)
    elif lval_width > max_width:
        lval = Extract(max_width-1, 0, lval)

    if rval_width < max_width:
        rval = ZeroExt(max_width - rval_width, rval)
    elif rval_width > max_width:
        rval = Extract(max_width-1, 0, rval)

    return lval, rval


def emit_cond_identifier(expr):
    smt_binary = SMTBinary()
    smt_binary.lval = emit_expr(expr)
    new_expr = pyverilog.vparser.ast.Constant('0')
    smt_binary.rval = SMTNumber(new_expr)
    smt_binary.opcode = "ne"
    smt_binary.term = (smt_binary.lval.term != smt_binary.rval.term)
    smt_binary.signal = f"{smt_binary.lval.signal}"
    return smt_binary

def smt_zeros(width):
    if width:
        str_list = ['0', 'b']
        for i in range(width):
            str_list.append('0')
    else:
        str_list = ['0', 'b', '0']
    return ''.join(str_list)

def get_bin_from_int(dec_num):
    if dec_num < 0:
        raise ValueError("dec_num < 0")
    else:
        return math.ceil(math.log2(dec_num))
    
def bv_pow(base, exp):
    # Basic checks for exponent value

    exp = simplify(exp)
    assert exp.as_long() >= 0, "exp is negative"

    if exp == 0:
        return BitVecVal(1, base.size())  # Assuming base is a BitVecRef
    elif exp == 1:
        return base
    else:
        result = base
        for _ in range(exp.as_long() - 1):
            result = result * base  # This uses the multiplication operator for BitVecRef
        return result
       


def dump_branch_id():
    """
    Dump the branch ID to the file.
    """
    with open(folder_pth+'branch_id.txt', 'w') as f:
        assign_counts = SMTAssign.get_assign_count();
        for i in range(assign_counts):
            assign = SMTAssign.get_assign(i)
            if assign.assign_type==SMTAssignType.SMT_ASSIGN_BRANCH:
                f.write(f'{assign.id}\n')    

def select_target():
    """
    Select the target branch from the branch_id.txt file.
    """
    branch_file_path = folder_pth + 'branch_id.txt'

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

    return SMTBasicBlock.target_num()




def extract_bit_value(var, ptr):

    bit_var = var.size()
    bit_ptr = ptr.size()

    ptr_bv = ZeroExt(bit_var-bit_ptr, ptr)  
    bit_mask = (1 << ptr_bv)
    extracted = LShR(var & bit_mask, ptr_bv)

    return extracted


def assign_bit_value(var, ptr, new_val_value):

    ptr_bv = ZeroExt(var.size()-ptr.size(), ptr)
    clear_mask = ~(1 << ptr_bv)
    var_cleared = var & clear_mask
    new_val_mask = ZeroExt(var.size()-new_val_value.size(), new_val_value) << ptr_bv
    var_new = var_cleared | new_val_mask

    return var_new

def cal_sig_width(width):
    if isinstance(width, Minus):
        return IntConst(int(str(width.left)) - int(str(width.right)))
    elif isinstance(width, Plus):
        return IntConst(int(str(width.left)) + int(str(width.right)))
    elif isinstance(width, Power):
        return IntConst(int(str(width.left)) ** int(str(width.right)))
    else:
        raise ValueError("Unsupported width type")