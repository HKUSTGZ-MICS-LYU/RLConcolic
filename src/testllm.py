import torch

print("PyTorch version:", torch.__version__)
print("CUDA available:", torch.cuda.is_available())
print("CUDA device count:", torch.cuda.device_count())
print("Using CUDA device:", torch.cuda.current_device())

if torch.cuda.is_available():
    print("CUDA is available! GPU will be used.")
else:
    print("CUDA is not available. Using CPU.")