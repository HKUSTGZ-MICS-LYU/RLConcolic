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
- **PyTorch**: For the reinforcement learning agent
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
│   ├── DQN.py             # Actor-critic agent (legacy filename)
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
# Run from the repository root (paths in Globals.py are relative to it).
python src/main.py
```

### 4. Verify the RL integration

The default simulation driver initializes the agent, ranks candidate branches
with its policy, and updates it using the reward and newly simulated register
state. Logs include `[RL] Initialized agent`, `[RL] Ranked`, and `[RL] Update`.
If random simulation already covers every target, no RL step is needed.

The existing agent in `src/DQN.py` is a one-step actor-critic with 128-unit hidden
layers. This integration does not implement the multi-step DQN described in the
paper; use that distinction when reporting baseline results.

With the dependencies above installed, run:

```bash
python -m unittest discover -s tests -v
```

The tests include full Icarus Verilog runs of `b06` and `b11` with seed 42,
`unroll=20`, `steps=5`, and one initial random simulation. They check that RL
updates actually change both networks, state transitions use new simulation
data, weights remain finite, and saved inputs reproduce the reported coverage.
Each RTL run uses a fresh temporary directory; its logs and generated test
inputs are retained at the path printed by the test.

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
