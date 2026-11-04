from GlobalVar import global_variable
from Globals import DATA_TYPE, SMTAssignType, SMTCLKType, clk_name
from SMTlib import SMTAssignStmt, SMTBasicBlock, SMTAssign, SMTBlockingAssign, SMTBranch, SMTBranchNode, SMTBranchStack, SMTNonBlockingAssign, SMTProcess, SMTSigCore, SMTSignal, emit_cond_expr, emit_expr
from Utilies import get_params
from pyverilog.vparser.ast import And, EventStatement, Integer, NotEq, Always, Assign, Block, BlockingSubstitution, CaseStatement, IfStatement, NonblockingSubstitution, Decl, Eq, Parameter, Pointer, Reg, SingleStatement, Wire

class CreateDut:
    def __init__(self, ast, top_module, unroll, reset_name, folder_path):
        """
        Constructor for the CreateDut class.
        """
        self.ast = ast
        self.top_module = top_module
        self.unroll = unroll
        self.file_path = folder_path
        self.reset_name = reset_name
        self.dut_file = folder_path + 'conquest_dut.v'


        self.incr = 0

    def main(self):
        """
        Create the DUT for the given Verilog file(s).
        """
        with open(self.dut_file, 'w') as f:
            self._emit_module_declaration(f)
            self._emit_ports_declaration(f)
            self._emit_parameter_declaration(f)
            self._emit_variables_declaration(f)
            self._emit_process(f)
            # self._emit_variable_display(f)

            f.write('endmodule\n')
        f.close()

    def _emit_parameter_declaration(self,f):
        """
        emit the module parameter declaration to the DUT.
        """
        self.incr += 4
        space = ' ' * self.incr
        if self.ast.description.definitions[0].paramlist:
            f.write(f'{space}//Parameter Declaration\n')
            f.flush()  # Flush the buffer to write content immediately
            for param in self.ast.description.definitions[0].paramlist.params:
                parameter = emit_expr(param.list[0])
                f.write(f'{space}parameter {parameter.name} = {parameter.value};\n')
                f.flush()  # Flush the buffer to write content immediately
        for item in self.ast.description.definitions[0].items:
            if isinstance(item, Decl):
                for variable in item.list:
                    if isinstance(variable, Parameter):
                        parameter = emit_expr(variable)
                        f.write(f'{space}parameter {parameter.name} = {parameter.value};\n')
                        f.flush()  # Flush the buffer to write content immediately
                        
        self.incr -= 4


    def _emit_module_declaration(self, f):
        """
        Emit the module declaration to the DUT.
        """
        if not self.ast.description:
            raise Exception("No module found in the AST")
        else:
            module_decl = self.ast.description.definitions[0]

        # Emit the module declaration
        module_name = module_decl.name
        portlist = {port.first.name for port in module_decl.portlist.ports}

        self._emit_scope_file_lineno(f, module_decl.lineno)
        f.write(f'module {module_name}({", ".join(portlist)}, __obs);\n\n')



    def _emit_ports_declaration(self, f):
        """
        Emit the ports declaration to the DUT.
        """
        self.incr += 4
        space = ' ' * self.incr

        module_decl = self.ast.description.definitions[0]
        ports_list = self._get_ports_list(module_decl)

        if ports_list:
            width_decl_len = max((len(f'[{details["width"]-1}:0]') for details in ports_list.values() if details.get('width')), default=0)
            for port, details in ports_list.items():
                direction = 'input' if details['direction'] == 'Input' else 'output'
                signed_decl = 'signed' if details.get('signed', False) else ''
                width_decl = f'[{details["width"]-1}:0]' if details.get('width') != 1 else None
                type_decl = f'{direction:<6} {signed_decl:<6}'
                
                # Dynamically adjust padding for width declaration
                if width_decl:
                    width_decl_formatted = f'{width_decl:<{width_decl_len}}'
                else:
                    width_decl_formatted = ' ' * width_decl_len  # Use spaces if width_decl is None
                # Writing the formatted string to the file
                f.write(f'{space}{type_decl} {width_decl_formatted} {port};\n')
                f.flush()  # Flush the buffer to write content immediately

            # Special handling for __obs port
            obs_declaration = f"{space}{'input':<6} {'':<6} {'':<{width_decl_len}} __obs;\n\n"
            f.write(obs_declaration)
            f.flush()  # Flush the buffer to write content immediately

        for port, details in ports_list.items():
            if details['type'] == 'Reg':
                if details.get('width') > 1:
                    f.write(f"{space}reg [{details['width']-1}:0] {port} = {details['width']}'b0;\n")
                else:
                    f.write(f"{space}reg {port} = 1'b0;\n")
                f.flush()  # Flush the buffer to write content immediately
        self.incr -= 4
    
    def _emit_variables_declaration(self, f):
        """
        Emit the variables declaration to the DUT.
        """
        self.incr += 4
        space = ' ' * self.incr

        module_decl = self.ast.description.definitions[0] 
        variables_list = self._get_variables_list(module_decl)
        
        for var_name, details in variables_list.items():
            signed_decl = 'signed' if details.get('signed', False) else ''
            var_type = details['type']
            W_msb = details.get('W_msb', 0)
            W_lsb = details.get('W_lsb', 0)
            D_msb = details.get('D_msb', 0)
            D_lsb = details.get('D_lsb', 0)
            width = W_msb - W_lsb + 1 if details['Width'] != 1 else 1
            dim_decl = f"[{D_msb}:{D_lsb}]" if details['Depth'] else None
            width_decl = f'[{W_msb}:{W_lsb}]' if details['Width'] != 1 else None
            init_value = details.get('init', None)
            if var_type in ['reg', 'integer']:
                self._write_variable_declaration(f, space, var_type, signed_decl, var_name, width_decl, width, dim_decl)
                f.flush()  # Flush the buffer to write content immediately
            elif var_type == 'wire':
                # Create a new process for the wire declaration
                if init_value:
                    smt_proc = SMTProcess(is_wired_block=True)
                    SMTProcess.current_process = smt_proc
                self._write_wire_declaration(f, space, var_type, signed_decl, var_name, width_decl, init_value)
                f.flush()  # Flush the buffer to write content immediately
                if init_value:
                    smt_proc.exit_block = smt_proc.top_bb
                    SMTProcess.current_process = None
            else:
                raise ValueError(f"Unsupported variable type: {var_type}")
            
        f.write('\n')

        self.incr -= 4

    def _emit_process(self, f):
        """
        Emit the process to the DUT.
        """
        self.incr += 4
        space = ' ' * self.incr

        
        for stmt in self.ast.description.definitions[0].items:
            if not isinstance(stmt, Decl):
                smt_proc = SMTProcess()
                SMTProcess.current_process = smt_proc
                self._emit_stmt(f, stmt)
                smt_proc.exit_block = smt_proc.top_bb
                SMTProcess.current_process = None

        self.incr -= 4

    def _emit_stmt(self, f, stmt):
        """
        Emit the statement to the DUT.
        """
        if isinstance(stmt, NonblockingSubstitution):
            self._emit_nonblocking_assignment(f, stmt)
        elif isinstance(stmt, BlockingSubstitution):
            self._emit_blocking_assignment(f, stmt)
        elif isinstance(stmt, IfStatement):
            self._emit_if_statement(f, stmt)
        elif isinstance(stmt, Block):
            self._emit_block(f, stmt)
        elif isinstance(stmt, CaseStatement):
            self._emit_case_statement(f, stmt)
        elif isinstance(stmt, Always):
            self._emit_always_block(f, stmt)
        elif isinstance(stmt, Assign):
            self._emit_assign_stmt(f, stmt)
        elif isinstance(stmt, SingleStatement):
            self._emit_single_stmt(f, stmt.statement)
        elif isinstance(stmt, EventStatement):
            self._emit_event_stmt(f, stmt)
        elif isinstance(stmt, Decl):
            self._emit_variable_declaration_in_block(f, stmt)
        else:
            raise ValueError(f"Unsupported statement type: {stmt.__class__.__name__}")

    def _emit_variable_declaration_in_block(self, f, stmt):
        """
        Emit the variable declaration to the DUT.
        """
        self.incr += 4
        space = ' ' * self.incr
        stmt = [stmt]
        variables_list = self._get_variables_list(stmt)
        for var_name, details in variables_list.items():
            signed_decl = 'signed' if details.get('signed', False) else ''
            var_type = details['type']
            W_msb = details.get('W_msb', 0)
            W_lsb = details.get('W_lsb', 0)
            D_msb = details.get('D_msb', 0)
            D_lsb = details.get('D_lsb', 0)
            width = W_msb - W_lsb + 1 if details['Width'] != 1 else 1
            dim_decl = f"[{D_msb}:{D_lsb}]" if details['Depth'] else None
            width_decl = f'[{W_msb}:{W_lsb}]' if details['Width'] != 1 else None
            if var_type in ['reg', 'integer']:
                width_decl = width_decl or ''
                dim_decl = dim_decl or ''
                if dim_decl:
                    f.write(f"{space}{var_type} {signed_decl} {width_decl:<6} {var_name} {dim_decl};\n")
                else:
                    if signed_decl == 'signed':
                        if width == 1:
                            f.write(f"{space}reg {signed_decl} {var_name} = 1'sb0;\n")
                        else:
                            f.write(f"{space}reg {signed_decl} {width_decl:<6} {var_name} = {width}'sb0;\n")
                    else:
                        if width == 1:
                            f.write(f"{space}reg {signed_decl} {var_name} = 1'b0;\n")
                        else:
                            f.write(f"{space}reg {signed_decl} {width_decl:<6} {var_name} = {width}'sb0;\n")
            elif var_type == 'wire':
                f.write(f"{space}{var_type} {signed_decl} {width_decl or ''} {var_name};\n")
            else:
                raise ValueError(f"Unsupported variable type: {var_type}")
            self.incr -= 4

    def _emit_single_stmt(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr

        f.write(f"{space}${stmt.syscall};\n")

        self.incr -= 4

    def _emit_always_block(self, f, stmt):
        self._emit_scope_file_lineno(f, stmt.lineno)
        self.incr += 4
        space = ' ' * self.incr

        f.write(f"{space}always @(")
        self._emit_event(f, stmt.sens_list)
        f.write(f") begin\n")
 

        if hasattr(stmt.statement, 'statements'):
            for substmt in stmt.statement.statements:
                self._emit_stmt(f, substmt)
        else:
            self._emit_stmt(f, stmt.statement)

        self._emit_variable_display(f)
        f.write(f"{space}end\n\n")
        self.incr -= 4

    def _emit_assign_stmt(self, f, stmt, wired_declared=False):
  
        space = ' ' * self.incr
        
        lval = stmt.left.var
        rval = stmt.right.var
        smt_lval = emit_expr(lval)
        smt_rval = emit_expr(rval)

   
        space = ' ' * self.incr

        f.write(f"{space}assign {smt_lval.signal} = {smt_rval.signal};\n\n")
        SMTAssignStmt(f, smt_lval, smt_rval, self.incr, wired_declared, assign = True)
        # f.write(f"{space}{smt_lval.signal} <= {smt_rval.signal};\n")
        # SMTNonBlockingAssign(f, smt_lval, smt_rval, self.incr)






        
    def _emit_event_stmt(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr
        if stmt.senslist.list[0].sig == None:
            f.write(f"{space}\n")
        else:
            raise ValueError("Unsupported event statement")
        self.incr -= 4



    def _emit_event(self, f, sens_list):
        have_all_trig = False
        have_edge_trig = False
        have_level_trig = False
        for sens_sig in sens_list.list:
            if sens_sig.sig == None:
                f.write(f" * ")
                have_all_trig = True
            else:
                SMTSignal(sens_sig.sig)
                if sens_sig.type == 'posedge':
                    have_edge_trig = True
                    f.write(f"posedge {sens_sig.sig.name}")
                    if sens_sig != sens_list.list[-1]:
                        f.write(' or ')
            
                elif sens_sig.type == 'negedge':
                    have_edge_trig = True
                    f.write(f"negedge {sens_sig.sig.name}")
                    if sens_sig != sens_list.list[-1]:
                        f.write(' or ')

                elif sens_sig.type == 'level':
                    have_level_trig = True
                    if isinstance(sens_sig.sig, Pointer):
                        f.write(f"{sens_sig.sig.var.name}[{sens_sig.sig.ptr.value}]")
                    else:
                        f.write(f"{sens_sig.sig.name}")
                    if sens_sig != sens_list.list[-1]:
                        f.write(' or ')

                else:
                    raise ValueError(f"Unsupported sensitivity type: {sens_sig.type}")
                
            if have_edge_trig and have_level_trig and have_all_trig:
                raise ValueError("Mixed edge and level triggered signals are not supported")
            elif not have_edge_trig and not have_level_trig and not have_all_trig:
                raise ValueError("No sensitivity signals found")
            elif have_edge_trig and not have_level_trig:
                SMTProcess.current_process.is_edge_triggered = True
            elif not have_edge_trig and have_level_trig:
                SMTProcess.current_process.is_edge_triggered = False
            elif have_all_trig:
                SMTProcess.current_process.is_edge_triggered = True

        




    def _emit_nonblocking_assignment(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr

        lval = stmt.left.var
        rval = stmt.right.var

        smt_rval = emit_expr(rval)
        smt_lval = emit_expr(lval)

        f.write(f"{space}{smt_lval.signal} <= {smt_rval.signal};")
        SMTNonBlockingAssign(f, smt_lval, smt_rval, self.incr)

        self.incr -= 4  

    def _emit_blocking_assignment(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr

        lval = stmt.left.var
        rval = stmt.right.var
     
        smt_rval = emit_expr(rval)
        smt_lval = emit_expr(lval)
  
        f.write(f"{space}{smt_lval.signal} = {smt_rval.signal};")
        SMTBlockingAssign(f, smt_lval, smt_rval)

    
        self.incr -= 4
    
    def _emit_blocked_stmt(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr
        if isinstance(stmt, Block):
            self._emit_block(f, stmt)
        else:
            f.write(f"{space}begin\n")
            smt_assign = SMTBranchStack.peek_branch_stack()
            smt_assign.instrument(f, self.incr)
            self._emit_stmt(f, stmt)
            f.write(f"{space}end\n")

        self.incr -= 4

    def _emit_if_statement(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr

        # Create a new branch node
        branch_node = SMTBranchNode()

        # Extract the condition expression
        condition = stmt.cond
        true_stmt = stmt.true_statement
        false_stmt = stmt.false_statement

        f.write(f"{space}if (")
        branch_node.cond = emit_cond_expr(condition)
        f.write(f"{branch_node.cond.signal})\n")

        branch_node.cond_width = 1

        true_br = SMTBranch.create_true_branch(branch_node)
        false_br = SMTBranch.create_false_branch(branch_node)

        true_bb = SMTBasicBlock()
        false_bb = SMTBasicBlock()

        true_br.block = true_bb
        false_br.block = false_bb

        true_bb.idom = SMTProcess.current_process.top_bb
        false_bb.idom = SMTProcess.current_process.top_bb

        true_bb.predecessors.add(SMTProcess.current_process.top_bb)
        false_bb.predecessors.add(SMTProcess.current_process.top_bb)

        SMTProcess.current_process.top_bb.successors.add(true_bb)
        SMTProcess.current_process.top_bb.successors.add(false_bb)

        true_bb.assign_list.append(true_br)
        false_bb.assign_list.append(false_br)

        exit_bb = SMTBasicBlock()
        exit_bb.idom = SMTProcess.current_process.top_bb

        SMTProcess.current_process.top_bb = true_bb
        if true_stmt:
            SMTBranchStack.push_to_branch_stack(true_br)
            self._emit_blocked_stmt(f, true_stmt)
            SMTBranchStack.pop_from_branch_stack()

        exit_bb.predecessors.add(SMTProcess.current_process.top_bb)
        SMTProcess.current_process.top_bb.successors.add(exit_bb)
        f.write(f"{space}else\n")
        SMTProcess.current_process.top_bb = false_bb

        if false_stmt:
            SMTBranchStack.push_to_branch_stack(false_br)
            self._emit_blocked_stmt(f, false_stmt)
            SMTBranchStack.pop_from_branch_stack()
        else:
            self.incr += 4
            space = ' ' * self.incr
            SMTBranchStack.push_to_branch_stack(false_br)
            smt_assign = SMTBranchStack.pop_from_branch_stack()
            smt_assign.instrument(f, self.incr)
            SMTBranchStack.pop_from_branch_stack()
            self.incr -= 4
        
        exit_bb.predecessors.add(SMTProcess.current_process.top_bb)
        SMTProcess.current_process.top_bb.successors.add(exit_bb)
        SMTProcess.current_process.top_bb = exit_bb
        self.incr -= 4
    
    def _emit_case_statement(self, f, stmt):
        self.incr += 4
        space = ' ' * self.incr

        comp_sig = stmt.comp

        parent_node = SMTBranchNode()
        parent_node.cond = emit_expr(comp_sig)
        parent_node.cond_width = 0

        f.write(f"{space}case ({parent_node.cond.signal})\n")

        top_bb = SMTProcess.current_process.top_bb
        exit_bb = SMTBasicBlock()
        exit_bb.idom = top_bb
        for case in stmt.caselist:
            if case.cond:# case condition
                case_expr = emit_expr(Eq(stmt.comp,case.cond[0]))
                smt_br = SMTBranch.create_case_branch(parent_node, case_expr)
                smt_bb = SMTBasicBlock()
                smt_br.block = smt_bb
                smt_bb.weight = 1
                smt_bb.assign_list.append(smt_br)
                smt_bb.predecessors.add(top_bb)
                smt_bb.idom = top_bb
                top_bb.successors.add(smt_bb)
                f.write(f"{space}  {case_expr.rval.signal}:\n")
                SMTBranchStack.push_to_branch_stack(smt_br)

                SMTProcess.current_process.top_bb = smt_bb  
                self._emit_blocked_stmt(f, case.statement)
            
                SMTBranchStack.pop_from_branch_stack()
                exit_bb.predecessors.add(SMTProcess.current_process.top_bb)
                SMTProcess.current_process.top_bb.successors.add(exit_bb)
            else:#default condition
                smt_br = SMTBranch.create_default_branch(parent_node, stmt)
                smt_bb = SMTBasicBlock()
                smt_br.block = smt_bb
                smt_bb.assign_list.append(smt_br)
                smt_bb.predecessors.add(top_bb)
                smt_bb.idom = top_bb
                top_bb.successors.add(smt_bb)
                f.write(f"{space}  default:\n")
                SMTBranchStack.push_to_branch_stack(smt_br)
                SMTProcess.current_process.top_bb = smt_bb
                self._emit_blocked_stmt(f, case.statement)
                SMTBranchStack.pop_from_branch_stack()
                exit_bb.predecessors.add(SMTProcess.current_process.top_bb)
                SMTProcess.current_process.top_bb.successors.add(exit_bb)
        SMTProcess.current_process.top_bb = exit_bb
        f.write(f"{space}endcase\n")
        self.incr -= 4

    def _emit_block(self, f, stmt):

        space = ' ' * self.incr
        f.write(f"{space}begin\n")

        smt_assign = SMTBranchStack.pop_from_branch_stack()
        smt_assign.instrument(f, self.incr)
        for substmt in stmt.statements:
            self._emit_stmt(f, substmt)

        f.write(f"{space}end\n")
     

    def _emit_variable_display(self, f):
        self.incr += 2
        space = ' ' * self.incr

        f.write(f"{space}  // Display the variables\n")
        # f.write(f"{space}  always @(posedge {clk_name})\n")
        f.write(f"{space}  begin\n")
        for details in SMTSigCore._sigcore_list.values():
            if details.type == DATA_TYPE.REG:
                if details.is_array:
                    for i in range(details.depth_count):
                        var_name = f"{details.name}[{i}]"
                        f.write(f"{space}  $display(\";R {var_name} = %d\", {var_name});\n")
                else:
                    f.write(f"{space}  $display(\";R {details.name} = %d\", {details.name});\n")


        f.write(f"{space}  end\n")

        self.incr -= 2


    def _get_ports_list(self, module_decl):
        """
        Extract the ports list from the AST.
        """
        # Extract the ports list
        ports_list = {}
        for port in module_decl.portlist.ports:
            SMTSigCore(port)
            msb = get_params(port.first.width.msb) if port.first.width else 0
            lsb = get_params(port.first.width.lsb) if port.first.width else 0
            width = msb - lsb + 1 if port.first.width else 1
            ports_list[port.first.name] = {
                "direction": port.first.__class__.__name__,
                "width": width,
                'msb': msb,
                'lsb': lsb,
                'signed': port.first.signed,
                'type': port.second.__class__.__name__ if port.second else 'wire'
            }
        return ports_list

    def _get_variables_list(self, module_decl):
        """
        Extract the variables list from the AST.
        """
        type_case = {'Reg': 'reg', 'Integer': 'integer', 'Wire': 'wire', 'Real': 'real'}
        # Extract the variables lis
        variables_list = {}
        for item in module_decl.items:
            if isinstance(item, Decl):
                for variable in item.list:
                    init_value = None
                    if isinstance(variable, Parameter):
                        continue
                    if isinstance(variable, Assign):
                        variables_list[item.list[0].name]['init'] = variable
                        break
             
                    SMTSigCore(variable)
                    name = variable.name
                    W_msb = get_params(variable.width.msb) if variable.width else 0
                    W_lsb = get_params(variable.width.lsb) if variable.width else 0
                    D_msb = get_params(variable.dimensions.lengths[0].msb) if variable.dimensions else 0
                    D_lsb = get_params(variable.dimensions.lengths[0].lsb) if variable.dimensions else 0
                    Width = W_msb - W_lsb + 1 if variable.width else 1
                    Depth = abs(D_msb - D_lsb) + 1 if variable.dimensions else None
                    type = variable.__class__.__name__
                    signed = variable.signed
                    if type not in ['Reg', 'Integer', 'Wire']:
                        raise ValueError(f"Unsupported variable type: {variable.__class__.__name__}")
                            
           
                    variables_list[name] = {
                        'type': type_case.get(variable.__class__.__name__, 'unknown'),
                        'Width': Width,
                        'W_msb': W_msb,
                        'W_lsb': W_lsb,
                        'Depth': Depth,
                        'D_msb': D_msb,
                        'D_lsb': D_lsb,
                        'signed': signed,
                        'init': init_value
                    }


        return variables_list

    def _emit_scope_file_lineno(self, f, lineno):
        """
        Emit the scope file and line number to the DUT.
        """
        space = ' ' * self.incr
        f.write(f"{space}//Following code is from line {lineno}\n")

    def _write_variable_declaration(self, f, space, var_type, signed_decl, var_name, width_decl, width, dim_decl):
        """
        Helper function to write variable declaration to file.
        """
        width_decl = width_decl or ''
        dim_decl = dim_decl or ''
        
        if dim_decl:
            f.write(f"{space}{var_type} {signed_decl} {width_decl:<6} {var_name} {dim_decl};\n")
        else:
            if signed_decl == 'signed':
                if width == 1:
                    f.write(f"{space}reg {signed_decl} {var_name} = 1'sb0;\n")
                else:
                    f.write(f"{space}reg {signed_decl} {width_decl:<6} {var_name} = {width}'sb0;\n")
            else:
                if width == 1:
                    f.write(f"{space}reg {signed_decl} {var_name} = 1'b0;\n")
                else:
                    f.write(f"{space}reg {signed_decl} {width_decl:<6} {var_name} = {width}'b0;\n")

    def _write_wire_declaration(self, f, space,  var_type, signed_decl, var_name, width_decl=None, init_value=None):
        """
        Helper function to write wire declaration to file.
        """
        f.write(f"{space}{var_type} {signed_decl} {width_decl or ''} {var_name};\n")
        if init_value != None:
            if isinstance(init_value, Assign):
                self._emit_assign_stmt(f, init_value)
            elif isinstance(init_value, Constant):
                f.write(f"{space}assign {var_name} = {init_value.value};\n")
