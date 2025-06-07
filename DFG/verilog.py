import os
import sys
import re
import networkx as nx
import itertools
import time

class VerilogDependencyAnalyzer:
    def __init__(self, verilog_file_path):
        """初始化分析器"""
        self.verilog_file = verilog_file_path
        self.dependency_graph = nx.DiGraph()
        self.module_name = None
        self.inputs = []
        self.outputs = []
        self.registers = []
        self.nets = []
        
    def analyze(self):
        """分析Verilog文件，构建依赖图"""
        print(f"开始分析Verilog文件: {self.verilog_file}")
        
        # 读取文件内容
        try:
            with open(self.verilog_file, 'r') as f:
                content = f.read()
        except Exception as e:
            print(f"读取文件出错: {e}")
            return False
            
        # 1. 提取模块名
        module_match = re.search(r'module\s+(\w+)', content)
        if module_match:
            self.module_name = module_match.group(1)
            print(f"发现模块: {self.module_name}")
        
        # 2. 提取输入端口
        input_matches = re.findall(r'input\s+(?:reg|wire)?\s*(?:\[\d+:\d+\])?\s*(\w+)', content)
        self.inputs = input_matches
        for input_var in self.inputs:
            self.dependency_graph.add_node(input_var, type='input')
        print(f"发现输入: {', '.join(self.inputs)}")
        
        # 3. 提取输出端口
        output_matches = re.findall(r'output\s+(?:reg)?\s*(?:\[\d+:\d+\])?\s*(\w+)', content)
        self.outputs = output_matches
        for output_var in self.outputs:
            self.dependency_graph.add_node(output_var, type='output')
        print(f"发现输出: {', '.join(self.outputs)}")
        
        # 4. 提取寄存器
        reg_matches = re.findall(r'reg\s+(?:\[\d+:\d+\])?\s*(\w+)', content)
        self.registers = [r for r in reg_matches if r not in self.outputs]  # 排除已作为输出的寄存器
        for reg_var in self.registers:
            self.dependency_graph.add_node(reg_var, type='register')
        print(f"发现寄存器: {', '.join(self.registers)}")
        
        # 5. 分析赋值语句，提取操作类型和依赖关系
        self._analyze_assignments(content)
        
        # 6. 特殊处理always块中的条件语句
        self._analyze_conditional_statements(content)
        
        # 7. 输出分析结果
        node_count = len(self.dependency_graph.nodes())
        edge_count = len(self.dependency_graph.edges())
        print(f"依赖图构建完成，包含 {node_count} 个节点和 {edge_count} 条边")
        
        return node_count > 0
    
    def _analyze_assignments(self, content):
        """分析赋值语句，提取操作类型和依赖关系"""
        print("分析赋值语句...")
        
        # 提取非阻塞赋值语句: var <= expr;
        nonblocking_assigns = re.findall(r'(\w+)\s*<=\s*([^;]+);', content)
        
        # 提取阻塞赋值语句: var = expr;
        blocking_assigns = re.findall(r'(?<!<=)(\w+)\s*=\s*([^;]+);', content)
        
        # 提取assign语句: assign var = expr;
        assign_stmts = re.findall(r'assign\s+(\w+)\s*=\s*([^;]+);', content)
        
        # 合并所有赋值语句进行分析
        all_assigns = []
        all_assigns.extend([('nonblocking', dst, expr) for dst, expr in nonblocking_assigns])
        all_assigns.extend([('blocking', dst, expr) for dst, expr in blocking_assigns])
        all_assigns.extend([('continuous', dst, expr) for dst, expr in assign_stmts])
        
        assignment_count = 0
        for assign_type, dst, expr in all_assigns:
            # 为目标变量创建节点
            if not self.dependency_graph.has_node(dst):
                self.dependency_graph.add_node(dst, type='variable')
            
            # 分析表达式类型和依赖关系
            self._analyze_expression(dst, expr, assign_type)
            assignment_count += 1
        
        print(f"分析了 {assignment_count} 个赋值语句")
    
    def _analyze_expression(self, dst, expr, assign_type):
        """分析表达式类型并建立依赖关系"""
        # 清理表达式（去除空格、括号等）
        cleaned_expr = expr.strip()
        
        # 提取表达式中的变量
        expr_vars = re.findall(r'\b([a-zA-Z_][a-zA-Z0-9_]*)\b', cleaned_expr)
        
        # 过滤掉数字和Verilog关键字
        valid_vars = [var for var in expr_vars if not var.isdigit() and var not in self._get_verilog_keywords()]
        
        # 分析操作类型 - 这是关键部分
        operation_type = self._determine_operation_type(cleaned_expr, dst)
        
        # 添加依赖关系
        for src in valid_vars:
            if not self.dependency_graph.has_node(src):
                self.dependency_graph.add_node(src, type='variable')
            
            # 边属性：操作类型和赋值类型
            self.dependency_graph.add_edge(src, dst, 
                                          operation=operation_type, 
                                          assignment=assign_type)
    
    def _determine_operation_type(self, expr, dst):
        """确定表达式的操作类型（增加、减少、布尔等）"""
        # 算术运算
        if re.search(r'\b{}\b\s*\+\s*\d+'.format(dst), expr):
            return 'self_increment'  # 自增: dst = dst + x
        if re.search(r'\b{}\b\s*\-\s*\d+'.format(dst), expr):
            return 'self_decrement'  # 自减: dst = dst - x
        if re.search(r'\d+\s*\+\s*\b{}\b'.format(dst), expr):
            return 'self_increment'  # 自增: dst = x + dst
        if re.search(r'\+', expr):
            return 'addition'        # 加法
        if re.search(r'\-', expr):
            return 'subtraction'     # 减法
        if re.search(r'\*', expr):
            return 'multiplication'  # 乘法
        if re.search(r'/', expr):
            return 'division'        # 除法
        
        # 逻辑运算
        if re.search(r'~', expr):
            return 'bitwise_not'     # 按位非
        if re.search(r'\|', expr):
            return 'bitwise_or'      # 按位或
        if re.search(r'&', expr):
            return 'bitwise_and'     # 按位与
        if re.search(r'\^', expr):
            return 'bitwise_xor'     # 按位异或
        
        # 逻辑操作
        if re.search(r'==', expr):
            return 'equality'        # 相等判断
        if re.search(r'!=', expr):
            return 'inequality'      # 不等判断
        if re.search(r'>=', expr):
            return 'greater_equal'   # 大于等于
        if re.search(r'<=', expr):
            return 'less_equal'      # 小于等于
        if re.search(r'>', expr):
            return 'greater_than'    # 大于
        if re.search(r'<', expr):
            return 'less_than'       # 小于
        if re.search(r'&&', expr):
            return 'logical_and'     # 逻辑与
        if re.search(r'\|\|', expr):
            return 'logical_or'      # 逻辑或
        if re.search(r'!', expr):
            return 'logical_not'     # 逻辑非
        
        # 移位操作
        if re.search(r'<<', expr):
            return 'shift_left'      # 左移
        if re.search(r'>>', expr):
            return 'shift_right'     # 右移
            
        # 条件操作
        if re.search(r'\?', expr) and re.search(r':', expr):
            return 'conditional'     # 条件表达式 (a ? b : c)
        
        # 如果是简单赋值，判断是常量赋值还是变量赋值
        if re.search(r'^\s*\d+\'[bdh][0-9a-fA-F_]+\s*$', expr) or re.search(r'^\s*\d+\s*$', expr):
            return 'constant_assignment'  # 常量赋值 (如 3'b101, 4'h9, 42)
        if re.search(r'^\s*\b[a-zA-Z_][a-zA-Z0-9_]*\b\s*$', expr):
            return 'variable_assignment'  # 变量赋值 (如 a = b)
        
        # 默认类型
        return 'complex_expression'
    
    def _analyze_conditional_statements(self, content):
        """分析条件语句，特别是对变量影响关系的判断"""
        print("分析条件语句和控制流...")
        
        # 提取always块
        always_blocks = re.findall(r'always\s*@\s*\([^)]*\)(.*?)(?=always|endmodule|$)', content, re.DOTALL)
        
        condition_count = 0
        for block in always_blocks:
            # 提取if条件
            if_conditions = re.findall(r'if\s*\(([^)]+)\)', block)
            
            # 提取case条件
            case_statements = re.findall(r'case\s*\(([^)]+)\)(.*?)endcase', block, re.DOTALL)
            
            # 分析if条件
            for condition in if_conditions:
                self._analyze_condition(condition, block)
                condition_count += 1
            
            # 分析case语句
            for case_var, case_body in case_statements:
                # 添加case变量作为控制依赖
                case_var = case_var.strip()
                if not self.dependency_graph.has_node(case_var):
                    self.dependency_graph.add_node(case_var, type='variable')
                
                # 提取case项
                case_items = re.findall(r'([^:]+):(.*?)(?=\d+\'[bdh]|[a-zA-Z_]|default|endcase|$)', case_body, re.DOTALL)
                
                for case_value, case_item_body in case_items:
                    # 提取该case项中的赋值
                    assignments = re.findall(r'(\w+)\s*<=\s*([^;]+);', case_item_body)
                    
                    for dst, expr in assignments:
                        # 为目标变量创建节点
                        if not self.dependency_graph.has_node(dst):
                            self.dependency_graph.add_node(dst, type='variable')
                        
                        # 添加case变量对赋值的控制依赖
                        self.dependency_graph.add_edge(case_var, dst, 
                                                     operation='control_dependency', 
                                                     condition=f'case({case_var})={case_value}')
                        
                        # 分析表达式
                        self._analyze_expression(dst, expr, 'nonblocking')
                
                condition_count += 1
        
        print(f"分析了 {condition_count} 个条件语句")
    
    def _analyze_condition(self, condition, context):
        """分析条件表达式及其影响的赋值"""
        # 提取条件中的变量
        condition_vars = re.findall(r'\b([a-zA-Z_][a-zA-Z0-9_]*)\b', condition)
        valid_condition_vars = [var for var in condition_vars if not var.isdigit() and var not in self._get_verilog_keywords()]
        
        # 确定条件类型
        condition_type = self._determine_condition_type(condition)
        
        # 查找条件之后的代码块（通常在begin-end之间）
        condition_pos = context.find(condition)
        begin_pos = context.find('begin', condition_pos)
        if begin_pos != -1:
            end_pos = self._find_matching_end(context, begin_pos)
            if end_pos != -1:
                condition_block = context[begin_pos + 5:end_pos]
                
                # 提取代码块中的赋值
                assignments = re.findall(r'(\w+)\s*<=\s*([^;]+);', condition_block)
                
                for dst, expr in assignments:
                    # 为目标变量创建节点
                    if not self.dependency_graph.has_node(dst):
                        self.dependency_graph.add_node(dst, type='variable')
                    
                    # 添加条件变量对赋值的控制依赖
                    for var in valid_condition_vars:
                        if not self.dependency_graph.has_node(var):
                            self.dependency_graph.add_node(var, type='variable')
                        
                        self.dependency_graph.add_edge(var, dst, 
                                                     operation='control_dependency',
                                                     condition=condition_type)
                    
                    # 分析表达式
                    self._analyze_expression(dst, expr, 'nonblocking')
    
    def _determine_condition_type(self, condition):
        """确定条件类型（相等、大小比较等）"""
        if re.search(r'==', condition):
            return 'equality'
        if re.search(r'!=', condition):
            return 'inequality'
        if re.search(r'>=', condition):
            return 'greater_equal'
        if re.search(r'<=', condition):
            return 'less_equal'
        if re.search(r'>', condition):
            return 'greater_than'
        if re.search(r'<', condition):
            return 'less_than'
        if re.search(r'&&', condition):
            return 'logical_and'
        if re.search(r'\|\|', condition):
            return 'logical_or'
        return 'complex_condition'
    
    def _find_matching_end(self, text, begin_pos):
        """找到匹配的end关键字位置"""
        nested_level = 1
        pos = begin_pos + 5  # Skip the 'begin' keyword
        
        while nested_level > 0 and pos < len(text):
            if text[pos:pos+5] == 'begin':
                nested_level += 1
                pos += 5
            elif text[pos:pos+3] == 'end':
                nested_level -= 1
                pos += 3
            else:
                pos += 1
                
        return pos - 3 if nested_level == 0 else -1
    
    def _get_verilog_keywords(self):
        """返回Verilog关键字列表"""
        return [
            'always', 'and', 'assign', 'begin', 'case', 'casex', 'casez', 'default',
            'else', 'end', 'endcase', 'endmodule', 'for', 'function', 'if', 'initial',
            'inout', 'input', 'module', 'negedge', 'not', 'or', 'output', 'parameter',
            'posedge', 'reg', 'wire', 'while', 'xor'
        ]
    
    def get_dependency_chain(self, target_variable):
        """获取目标变量的依赖链"""
        if not self.dependency_graph.has_node(target_variable):
            print(f"警告: 变量 {target_variable} 不在依赖图中")
            return {}
        
        # 使用NetworkX反向遍历生成依赖树
        deps = {}
        
        def traverse_dependencies(node, visited=None, depth=0):
            if visited is None:
                visited = set()
            
            # 防止过深递归和循环依赖
            if node in visited or depth > 20:
                return {}
            
            visited.add(node)
            node_deps = {}
            
            # 获取当前节点的所有前驱（依赖节点）
            for pred in self.dependency_graph.predecessors(node):
                edge_data = self.dependency_graph.get_edge_data(pred, node)
                operation = edge_data.get('operation', 'unknown')
                assignment = edge_data.get('assignment', '')
                condition = edge_data.get('condition', '')
                
                # 添加带有操作类型的依赖
                node_deps[f"{pred} [{operation}]"] = traverse_dependencies(pred, visited.copy(), depth+1)
            
            return node_deps
        
        deps[target_variable] = traverse_dependencies(target_variable)
        return deps
    
    def save_dependency_chain_to_file(self, target_variable, filename):
        """将依赖链保存到文件中"""
        deps = self.get_dependency_chain(target_variable)
        
        if not deps:
            return False
            
        with open(filename, 'w') as f:
            f.write(f"依赖链分析结果：变量 {target_variable}\n")
            f.write("=" * 50 + "\n")
            self._write_dependency_chain(deps, f)
        
        return True
    
    def _write_dependency_chain(self, deps, file, level=0):
        """写入依赖链到文件"""
        for var, var_deps in deps.items():
            file.write("  " * level + f"- {var}\n")
            if var_deps and level < 20:  # 避免过深递归
                self._write_dependency_chain(var_deps, file, level + 1)
    
    def get_propagation_path(self, source_variable, target_variable, cutoff=10):
        """获取从源变量到目标变量的传播路径，设置最大长度限制防止过长路径"""
        if not (self.dependency_graph.has_node(source_variable) and 
                self.dependency_graph.has_node(target_variable)):
            return []
        
        # 使用NetworkX查找所有路径，限制路径长度避免过多结果
        try:
            paths = list(nx.all_simple_paths(self.dependency_graph, 
                                            source_variable, 
                                            target_variable, 
                                            cutoff=cutoff))
            return paths
        except nx.NetworkXNoPath:
            return []
        except Exception as e:
            print(f"寻找路径时出错: {e}")
            return []
    
    def save_propagation_paths_to_file(self, source_variable, target_variable, filename, cutoff=10):
        """将传播路径保存到文件中"""
        paths = self.get_propagation_path(source_variable, target_variable, cutoff)
        
        with open(filename, 'w') as f:
            f.write(f"传播路径分析结果：从 {source_variable} 到 {target_variable}\n")
            f.write("=" * 50 + "\n")
            
            if not paths:
                f.write("没有找到传播路径\n")
                return False
                
            f.write(f"找到 {len(paths)} 条传播路径:\n\n")
            
            # 限制输出的路径数量，避免文件过大
            max_paths_to_show = min(100, len(paths))
            for i, path in enumerate(paths[:max_paths_to_show]):
                f.write(f"路径 {i+1}: {' -> '.join(path)}\n")
                
                # 路径详情，包括操作类型
                f.write("详细信息:\n")
                for j in range(len(path)-1):
                    src, dst = path[j], path[j+1]
                    edge_data = self.dependency_graph.get_edge_data(src, dst)
                    operation = edge_data.get('operation', 'unknown')
                    assignment = edge_data.get('assignment', '')
                    condition = edge_data.get('condition', '')
                    
                    details = f"操作: {operation}"
                    if assignment:
                        details += f", 赋值类型: {assignment}"
                    if condition:
                        details += f", 条件: {condition}"
                    
                    f.write(f"  {src} -> {dst} ({details})\n")
            
            if len(paths) > max_paths_to_show:
                f.write(f"\n... 还有 {len(paths) - max_paths_to_show} 条路径未显示\n")
                
        return True
    
    def save_operation_summary(self, filename):
        """生成变量操作类型摘要"""
        try:
            with open(filename, 'w') as f:
                f.write("变量操作类型摘要\n")
                f.write("=" * 50 + "\n\n")
                
                # 按变量分组的操作统计
                f.write("各变量的操作类型:\n")
                
                for node in sorted(self.dependency_graph.nodes()):
                    # 获取该变量作为目标的所有边
                    incoming_edges = list(self.dependency_graph.in_edges(node, data=True))
                    
                    if incoming_edges:
                        f.write(f"\n变量: {node}\n")
                        
                        # 按操作类型分组
                        operations = {}
                        for src, dst, data in incoming_edges:
                            op = data.get('operation', 'unknown')
                            if op not in operations:
                                operations[op] = []
                            operations[op].append(src)
                        
                        # 输出每种操作类型
                        for op, sources in sorted(operations.items()):
                            sources_str = ', '.join(sources)
                            f.write(f"  - {op}: 来自 {sources_str}\n")
                
                # 按操作类型分组的统计
                f.write("\n\n按操作类型分组的统计:\n")
                
                op_groups = {}
                for u, v, data in self.dependency_graph.edges(data=True):
                    op = data.get('operation', 'unknown')
                    if op not in op_groups:
                        op_groups[op] = []
                    op_groups[op].append((u, v))
                
                for op, edges in sorted(op_groups.items()):
                    f.write(f"\n操作: {op} (总计: {len(edges)})\n")
                    for src, dst in sorted(edges):
                        f.write(f"  - {src} -> {dst}\n")
            
            print(f"操作类型摘要已保存到文件 {filename}")
            return True
        except Exception as e:
            print(f"保存操作类型摘要出错: {e}")
            return False
    
    def save_dependency_graph_to_file(self, filename):
        """将整个依赖图保存为文本文件"""
        try:
            with open(filename, 'w') as f:
                f.write("Verilog数据依赖图\n")
                f.write("=" * 50 + "\n\n")
                
                f.write(f"模块名: {self.module_name or '未知'}\n\n")
                
                # 基本统计信息
                f.write(f"节点总数: {len(self.dependency_graph.nodes())}\n")
                f.write(f"边总数: {len(self.dependency_graph.edges())}\n\n")
                
                # 输入节点
                f.write(f"输入节点 ({len(self.inputs)}):\n")
                for node in sorted(self.inputs):
                    f.write(f"- {node}\n")
                
                # 输出节点
                f.write(f"\n输出节点 ({len(self.outputs)}):\n")
                for node in sorted(self.outputs):
                    f.write(f"- {node}\n")
                
                # 寄存器节点
                f.write(f"\n寄存器节点 ({len(self.registers)}):\n")
                for node in sorted(self.registers):
                    f.write(f"- {node}\n")
                
                # 其他节点
                other_nodes = [n for n in self.dependency_graph.nodes() 
                              if n not in self.inputs and n not in self.outputs and n not in self.registers]
                f.write(f"\n其他节点 ({len(other_nodes)}):\n")
                for node in sorted(other_nodes):
                    f.write(f"- {node}\n")
                
                # 所有节点的度信息
                f.write(f"\n所有节点的度信息:\n")
                for node in sorted(self.dependency_graph.nodes()):
                    in_degree = self.dependency_graph.in_degree(node)
                    out_degree = self.dependency_graph.out_degree(node)
                    node_type = self.dependency_graph.nodes[node].get('type', 'unknown')
                    f.write(f"- {node} (类型: {node_type}, 入度: {in_degree}, 出度: {out_degree})\n")
                
                # 所有边（带操作信息）
                f.write(f"\n所有边:\n")
                for src, dst, data in sorted(self.dependency_graph.edges(data=True)):
                    operation = data.get('operation', 'unknown')
                    assignment = data.get('assignment', '')
                    condition = data.get('condition', '')
                    
                    details = f"操作: {operation}"
                    if assignment:
                        details += f", 赋值类型: {assignment}"
                    if condition:
                        details += f", 条件: {condition}"
                    
                    f.write(f"- {src} -> {dst} ({details})\n")
            
            print(f"依赖图已保存到文件 {filename}")
            return True
        except Exception as e:
            print(f"保存依赖图出错: {e}")
            return False
    
    def analyze_all(self, output_dir="verilog_analysis_results"):
        """全面分析RTL代码中的所有变量关系"""
        start_time = time.time()
        
        # 创建输出目录
        os.makedirs(output_dir, exist_ok=True)
        print(f"分析结果将保存到目录: {output_dir}")
        
        try:
            # 保存整个依赖图
            print("保存完整依赖图...")
            self.save_dependency_graph_to_file(f"{output_dir}/dependency_graph.txt")
            
            # 保存操作类型摘要
            print("生成操作类型摘要...")
            self.save_operation_summary(f"{output_dir}/operation_summary.txt")
            
            # 创建子目录
            dependencies_dir = f"{output_dir}/dependencies"
            paths_dir = f"{output_dir}/paths"
            os.makedirs(dependencies_dir, exist_ok=True)
            os.makedirs(paths_dir, exist_ok=True)
            
            # 1. 分析所有输出和寄存器的依赖链
            print("分析所有输出和重要寄存器的依赖链...")
            important_nodes = self.outputs + self.registers
            for i, node in enumerate(important_nodes):
                if i % 5 == 0:  # 每5个节点显示一次进度
                    elapsed = time.time() - start_time
                    print(f"进度: {i}/{len(important_nodes)} 节点 (用时: {elapsed:.2f}秒)")
                    
                node_safe_name = re.sub(r'[^\w]', '_', node)  # 替换非字母数字字符为下划线
                self.save_dependency_chain_to_file(node, f"{dependencies_dir}/{node_safe_name}_dependencies.txt")
            
            # 2. 分析从输入到输出的传播路径
            print("分析从输入到输出的传播路径...")
            paths_analyzed = 0
            for src in self.inputs:
                for dst in self.outputs:
                    elapsed = time.time() - start_time
                    print(f"分析路径: {src} -> {dst} (已用时: {elapsed:.2f}秒)")
                    
                    src_safe = re.sub(r'[^\w]', '_', src)
                    dst_safe = re.sub(r'[^\w]', '_', dst)
                    self.save_propagation_paths_to_file(src, dst, f"{paths_dir}/path_{src_safe}_to_{dst_safe}.txt")
                    paths_analyzed += 1
            
            # 3. 生成汇总报告
            with open(f"{output_dir}/analysis_summary.txt", "w") as f:
                elapsed = time.time() - start_time
                f.write("Verilog数据依赖与传播路径分析汇总\n")
                f.write("=" * 50 + "\n\n")
                f.write(f"分析文件: {self.verilog_file}\n")
                f.write(f"模块名: {self.module_name or '未知'}\n")
                f.write(f"分析时间: {elapsed:.2f}秒\n\n")
                
                f.write(f"节点总数: {len(self.dependency_graph.nodes())}\n")
                f.write(f"边总数: {len(self.dependency_graph.edges())}\n")
                f.write(f"输入节点数: {len(self.inputs)}\n")
                f.write(f"输出节点数: {len(self.outputs)}\n")
                f.write(f"寄存器节点数: {len(self.registers)}\n\n")
                
                # 添加操作类型统计
                op_counts = {}
                for _, _, data in self.dependency_graph.edges(data=True):
                    op = data.get('operation', 'unknown')
                    op_counts[op] = op_counts.get(op, 0) + 1
                
                f.write("操作类型统计:\n")
                for op, count in sorted(op_counts.items(), key=lambda x: x[1], reverse=True):
                    f.write(f"- {op}: {count} 条边\n")
                
                f.write("\n分析内容:\n")
                f.write(f"1. 依赖链分析 ({len(important_nodes)} 个节点)\n")
                f.write(f"2. 传播路径分析 ({paths_analyzed} 条路径)\n")
                f.write(f"3. 操作类型摘要 (见 operation_summary.txt)\n\n")
                
                f.write("输入节点:\n")
                for node in sorted(self.inputs):
                    f.write(f"- {node}\n")
                    
                f.write("\n输出节点:\n")
                for node in sorted(self.outputs):
                    f.write(f"- {node}\n")
                    
                f.write("\n寄存器节点:\n")
                for node in sorted(self.registers):
                    f.write(f"- {node}\n")
            
            print(f"分析完成，总用时: {time.time() - start_time:.2f}秒")
            print(f"结果保存在目录: {output_dir}")
            
            return {
                "inputs": self.inputs,
                "outputs": self.outputs,
                "registers": self.registers,
                "node_count": len(self.dependency_graph.nodes()),
                "edge_count": len(self.dependency_graph.edges()),
                "operations": op_counts
            }
            
        except Exception as e:
            print(f"分析过程出错: {e}")
            import traceback
            traceback.print_exc()
            return None

def analyze_verilog_file(verilog_file_path, output_dir="analysis_results"):
    """分析Verilog文件并生成依赖图和报告"""
    
    # 确保文件存在
    if not os.path.isfile(verilog_file_path):
        print(f"错误: 找不到文件 '{verilog_file_path}'")
        return None
    
    # 创建分析器
    analyzer = VerilogDependencyAnalyzer(verilog_file_path)
    
    # 分析文件
    if not analyzer.analyze():
        print("分析失败")
        return None
    
    # 生成详细报告
    result = analyzer.analyze_all(output_dir)
    
    return result


if __name__ == "__main__":
        
    verilog_file_path = '/hpc/home/connect.ytan910/code/AgentBeamConcolic/DFG/test.v'
    output_dir = "analysis_results"
    topmodule = "test"
    
    # 执行全面分析
    analyze_verilog_file(verilog_file_path, output_dir)