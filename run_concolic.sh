#!/bin/bash

# 加载找到的 CUDA 10.2 模块
module load cuda/cuda-11.7

#  设置 CUDA 环境变量（使用模块加载后的路径）
export PATH=/usr/local/cuda-11.7/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.7/lib64:$LD_LIBRARY_PATH

# 激活 conda 环境
source /hpc/home/connect.ytan910/anaconda3/bin/activate cuda

# 检查 NVIDIA 驱动和 GPU 状态
nvidia-smi

# Run the main script
python /hpc/home/connect.ytan910/code/Concolic/src/main.py
# python /hpc/home/connect.ytan910/code/LLM_Concolic/test.py