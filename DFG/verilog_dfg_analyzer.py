#!/usr/bin/env python3
# ==============================================================
# verilog_dfg_analyzer.py
#   按变量列出所有赋值语句，并标注 inc / dec / toggle /
#   set-const / overwrite-expr / unknown
#
# 依赖： pip install pyverilog
# ==============================================================

from pathlib import Path
from typing  import Dict, List

from pyverilog.vparser.parser import parse
from pyverilog.vparser.ast   import (
    Node, Identifier, IntConst,
    Plus, Minus, Ulnot, Assign,
    BlockingSubstitution, NonblockingSubstitution,
    Rvalue, Lvalue
)
from pyverilog.ast_code_generator.codegen import ASTCodeGenerator
cg = ASTCodeGenerator()

# -----------------------------------------------------------------
# 0. 工具函数
# -----------------------------------------------------------------
def strip(node: Node) -> Node:
    """剥掉 Rvalue/Lvalue 包装，返回真正表达式结点"""
    while isinstance(node, (Rvalue, Lvalue)):
        node = node.var
    return node

def id_names(n: Node) -> List[str]:
    if isinstance(n, Identifier):
        return [n.name]
    res: List[str] = []
    for v in vars(n).values():
        if isinstance(v, Node):
            res.extend(id_names(v))
        elif isinstance(v, (list, tuple)):
            for item in v:
                if isinstance(item, Node):
                    res.extend(id_names(item))
    return res

# -----------------------------------------------------------------
# 1. 判定 RHS 对 LHS 的 effect
# -----------------------------------------------------------------
def classify_effect(lhs: str, rhs_raw: Node) -> str:
    rhs = strip(rhs_raw)

    # set-const
    if isinstance(rhs, IntConst):
        return "set-const"

    # toggle
    if isinstance(rhs, Ulnot):
        t = strip(rhs.children()[0])
        if isinstance(t, Identifier) and t.name == lhs:
            return "toggle"

    # inc
    if isinstance(rhs, Plus):
        a, b = map(strip, rhs.children())
        if isinstance(a, Identifier) and a.name == lhs and isinstance(b, IntConst):
            return "inc"
        if isinstance(b, Identifier) and b.name == lhs and isinstance(a, IntConst):
            return "inc"

    # dec
    if isinstance(rhs, Minus):
        a, b = map(strip, rhs.children())
        if isinstance(a, Identifier) and a.name == lhs and isinstance(b, IntConst):
            return "dec"

    # overwrite-expr
    if lhs not in id_names(rhs):
        return "overwrite-expr"

    return "unknown"

# -----------------------------------------------------------------
# 2. 记录一次赋值
# -----------------------------------------------------------------
class AssignInfo:
    """保存一次赋值的文字与 effect"""
    def __init__(self, sid: int, node: Node):
        self.sid  = sid
        self.lhs  = cg.visit(strip(node.left))
        self.rhs  = node.right
        self.rhs_txt = cg.visit(strip(self.rhs))
        self.effect = classify_effect(id_names(node.left)[0], self.rhs)

    def pretty(self) -> str:
        return f"Stmt#{self.sid:<3} {self.lhs} <= {self.rhs_txt:<20} ({self.effect})"

# -----------------------------------------------------------------
# 3. 收集所有赋值
# -----------------------------------------------------------------
def collect_assigns(ast: Node) -> Dict[str, List[AssignInfo]]:
    acc: Dict[str, List[AssignInfo]] = {}
    sid = 0
    stack = [ast]
    while stack:
        n = stack.pop()
        if isinstance(n, (Assign, BlockingSubstitution, NonblockingSubstitution)):
            info = AssignInfo(sid, n)
            sid += 1
            for v in id_names(n.left):
                acc.setdefault(v, []).append(info)
        for v in vars(n).values():
            if isinstance(v, Node):
                stack.append(v)
            elif isinstance(v, (list, tuple)):
                stack.extend([e for e in v if isinstance(e, Node)])
    return acc

# -----------------------------------------------------------------
# 4. 打印结果
# -----------------------------------------------------------------
def print_var_flow(vfile: str):
    if not Path(vfile).is_file():
        raise FileNotFoundError(vfile)

    # 不传 preprocess 参数，兼容所有 PyVerilog 版本
    ast, _ = parse([vfile])

    assigns = collect_assigns(ast)

    print("\n================ 变量数据流 =================")
    for var in sorted(assigns):
        print(var)
        for a in assigns[var]:
            print("  ", a.pretty())
        print()

# -----------------------------------------------------------------
if __name__ == "__main__":
    VERILOG_FILE = "test.v"      # ← 改成你的 Verilog 文件
    print_var_flow(VERILOG_FILE)