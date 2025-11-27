# RLConcolic

RLConcolic is a research repository that combines Reinforcement Learning (RL) with concolic (concrete symbolic) execution to improve coverage-driven testing for RTL (Register Transfer Level) designs.  This tool leverages symbolic execution, constraint solving, and machine learning techniques to systematically generate high-quality test cases for Verilog hardware designs.

## Requirements

### System Requirements
- **Operating System**: Linux (Ubuntu 20.04+ recommended)
- **Python**: 3.7+ (Python 3.8+ recommended)
- **C Compiler**: GCC or Clang for building native extensions

### Dependencies
- **Pyverilog**: Verilog parsing and analysis framework
- **Z3 SMT Solver**: Constraint solving and satisfiability checking
- **Icarus Verilog (iverilog)**: Verilog simulation backend
- **PyTorch**: For DQN-based reinforcement learning
- **Additional Python packages**: Listed in `requirements.txt`

## Installation

### 1. Clone the Repository
```bash
git clone https://github. com/HKUSTGZ-MICS-LYU/RLConcolic.git
cd RLConcolic
```

### 2. Set Up Python Environment (Recommended)
```bash
# Create virtual environment
python3 -m venv venv
source venv/bin/activate  
```

### 3. Install System Dependencies
```bash
# Install Icarus Verilog
sudo apt-get update
sudo apt-get install iverilog
```

### 4. Install Python Dependencies
```bash
# Install from requirements file
pip install -r requirements.txt

# Install Z3 SMT solver
pip install z3-solver

# Install Pyverilog
pip install pyverilog

# Install PyTorch (for DQN)
pip install torch torchvision
```

### 5.  Verify Installation
```bash
# Test imports
python -c "import z3; import pyverilog; import torch; print('Installation successful!')"

# Check iverilog installation
iverilog -V
```
## Project Structure

```
RLConcolic/
├── src/                    # Source code
│   ├── main.py            # Main entry point
│   ├── GlobalVar.py       # Global variable configurations
│   ├── Globals.py         # Global configurations
│   ├── DQN.py             # Deep Q-Network implementation
│   ├── Simulate.py        # Simulation engine
│   ├── SMTlib.py          # SMT solver interface
│   ├── TbCreate.py        # Testbench creation utilities
│   ├── MultiTbCreate.py   # Multiple testbench generator
│   ├── DutCreate.py       # Device Under Test (DUT) setup
│   ├── RandomTest.py      # Random test generation
│   ├── Utilies.py         # Utility functions
│   └── pyverilog/         # Pyverilog integration
├── test/                  # Test cases and example designs
├── requirements.txt       # Python dependencies
└── README.md             
```

## Quick Start

### 1.  Prepare Your Verilog Design
Place your Verilog files in the `test/` directory:
```bash
mkdir -p test/designs
# Copy your . v files to test/designs/
```

### 2. Configure the Tool
Edit the configuration files in `src/Globals.py` 
```python
# Target Verilog design
TARGET_FILE = "test/designs/your_design.v"
TOP_MODULE = "your_top_module"
```

### 3. Run the Tool
```bash
cd src
python main.py
```

## Citation

If you use RLConcolic in your research, please cite:

```bibtex
@inproceedings{rlconcolic2026,
  title={RLConcolic: Reinforcement Learning Enhanced Concolic Testing for RTL},
  author={Tan, Yan and Meng, Xiangchen and Lyu, Yangdi},,
  booktitle={2026 Design, Automation \& Test in Europe Conference \& Exhibition (DATE)},
  year={2026},
  organization={IEEE}
}
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
