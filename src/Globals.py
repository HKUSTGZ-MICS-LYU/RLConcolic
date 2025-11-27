import enum
from enum import auto, Enum
import os
import z3
from z3 import set_param, set_option

set_option(max_width=10000000)

class DATA_TYPE(Enum):
    REG = auto()
    WIRE = auto()
    INPUT = auto()


class CNST_TYPE(Enum):
    CNST_TYPE_BRANCH = auto()
    CNST_TYPE_ASSIGN = auto()
    CNST_TYPE_STATE = auto()
    CNSY_TYPE_CLK = auto()
    CNST_TYPE_ASSIGN_NON_BLOCKING = auto()

class SMTExprType(Enum):
    SMT_EXPR_BINARY = auto()
    SMT_EXPR_UNARY = auto()
    SMT_EXPR_TERNARY = auto()
    SMT_EXPR_IDENTIFIER = auto()
    SMT_EXPR_CONSTANT = auto()
    SMT_EXPR_CUSTOM = auto()
    SMT_EXPR_POINTER = auto()
    SMT_EXPR_CONCAT = auto()
    SMT_EXPR_PART_SELECT = auto()
    SMT_EXPR_COND = auto()
    SMT_EXPR_REPEAT = auto()
    SMT_EXPR_PARAM = auto()

class SMTCLKType(Enum):
    SMT_CLK_CURR = auto()
    SMT_CLK_NEXT = auto()
    SMT_CLK_LAST = auto()

class SMTAssignType(Enum):
    SMT_ASSIGN = auto()
    SMT_ASSIGN_BLOCKING = auto()
    SMT_ASSIGN_NON_BLOCKING = auto()
    SMT_ASSIGN_BRANCH = auto()


class SMTBranchType(Enum):
    SMT_BRANCH_IF = auto()
    SMT_BRANCH_CASE = auto()
    
class CNST_TYPE(Enum):
    CNST_CLK = auto()
    CNST_BRANCH = auto()
    CNST_ASSIGN = auto()
    CNST_ASSIGN_NON_BLOCKING = auto() 
    CNST_ASSIGN_BLOCKING = auto() 
    CNST_STATE = auto()
    CNST_SYNC = auto()

configurations = {
    'grammerTest': {
        'file_path': './test/grammertest/grammerTest.v',
        'top_module': 'grammerTest',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1',
    },

    'b01': {
        'file_path': './test/b01/b01.v',
        'top_module': 'b01',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b06': {
        'file_path': './test/b06/b06.v',
        'top_module': 'b06',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b07': {
        'file_path': './test/b07/b07.v',
        'top_module': 'b07',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b10': {
        'file_path': './test/b10/b10.v',
        'top_module': 'b10',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b11': {
        'file_path': './test/b11/b11.v',
        'top_module': 'b11',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },
    
    'b12': {
        'file_path': './test/b12/b12.v',
        'top_module': 'b12',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b14': {
        'file_path': './test/b14/b14.v',
        'top_module': 'b14',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b15': {
        'file_path': './test/b15/b15.v',
        'top_module': 'b15',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b17': {
        'file_path': './test/b17/b17.v',
        'top_module': 'b17',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },
    
    'b19': {
        'file_path': './test/b19/b19.v',
        'top_module': 'b19',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b20': {
        'file_path': './test/b20/b20.v',
        'top_module': 'b20',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b21': {
        'file_path': './test/b21/b21.v',
        'top_module': 'b21',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b22': {
        'file_path': './test/b22/b22.v',
        'top_module': 'b22',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'b30':{
        'file_path': './test/b30/b30.v',
        'top_module': 'b30',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1' 
    },
  
    'or1200': {
        'file_path': './test/or1200/f_or1200.v',
        'top_module': 'or1200_top',
        'clk_name': 'clk_i',
        'reset_name': 'rst_i',
        'reset_edge': '1'
    },

    'DCache': {
        'file_path': './test/DCache/or1200_DCache_95.v',
        'top_module': 'or1200_dc_fsm',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'ICache': {
        'file_path': './test/ICache/or1200_ICache_95.v',
        'top_module': 'or1200_ic_fsm',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'Exception': {
        'file_path': './test/Exception/or1200_Exception_95.v',
        'top_module': 'or1200_except',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'rocketchip': {
        'file_path': '/hpc/home/connect.ytan910/code/Concolic/test/rocketchip/rocketchip.v',
        'top_module': 'RocketTile',
        'clk_name': 'clock',
        'reset_name': 'reset',
        'reset_edge': '1'
    },

    'test': {
        'file_path': './test/test/i2c_master_bit_ctrl.v',
        'top_module': 'i2c_master_bit_ctrl',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'i2c': {
        'file_path': './test/i2c/f_top.v',
        'top_module': 'top',
        'clk_name': 'wb_clk_i',
        'reset_name': 'wb_rst_i',
        'reset_edge': '1'
    },
    'usb_phy': {    
        'file_path': './test/usb_phy/usb_phy.v',
        'top_module': 'usb_phy',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '0'
    },
        'T1000': {
        'file_path': './test/AES-T1000/T1000.v',
        'top_module': 'top',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'mips': {
        'file_path': './test/mips/mips.v',
        'top_module': 'mips',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '1'
    },
    'usb_phy': {
        'file_path': './test/usb_phy/usb_phy.v',
        'top_module': 'usb_phy',
        'clk_name': 'clk',
        'reset_name': 'rst',
        'reset_edge': '0'
    },
    
}

initial_distance = 999
unroll = 50
steps = 5

assert steps<=unroll, "steps should be less than unroll"
limit_iter = 3
random_sim = 5
simulator = 'iverilog'

testbench = 'b06'  # Change this to the desired testbench name
selected_config = configurations[testbench]

file_pth = selected_config['file_path']
top_module = selected_config['top_module']
clk_name = selected_config['clk_name']
reset_name = selected_config['reset_name']
reset_edge = selected_config['reset_edge']

folder_pth = os.path.dirname(file_pth) + '/'
target_pth = os.path.dirname(file_pth) + '/target_constraints.txt'
dut_file = folder_pth + 'conquest_dut.v'
tb_file = folder_pth + 'conquest_tb.v'
multi_tb_file = folder_pth + 'conquest_tb_multi.v'



dqn_init = False
dqn_agent = None
debug = False
s = z3.Solver()

llm_agent = False
bing_search = True

search_time = 0 
mutate_num = 0

allsim_time = 0
