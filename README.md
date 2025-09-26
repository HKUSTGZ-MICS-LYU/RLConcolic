# py_Concolic

基于Python的硬件Concolic测试工具

## 环境要求

- Python 3.7+
- Pyverilog (用于词法分析和语法解析)
- Z3 SMT solver
- Icarus Verilog (iverilog) 模拟器

## 安装步骤

1. 克隆项目

```bash
git clone https://github.com/HKUSTGZ-MICS-LYU/py_Concolic.git
cd py_Concolic
```

2. 安装依赖

```bash
# 安装 iverilog 
sudo apt-get install iverilog

# 安装 Z3 solver
pip install z3-solver

# 安装 Pyverilog
git clone https://github.com/PyHDI/Pyverilog.git
cd Pyverilog
python setup.py install
```

## 使用说明

1. 配置测试文件
在 globals.py 中配置目标Verilog文件路径和相关参数

2. 运行测试

```python
python src/main.py
```