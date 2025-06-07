import sys
import time
import requests
import json
import sys
from Globals import *
from DQN import *
from GlobalVar import global_variable
from pathlib import Path
from typing import Iterator, List, Literal, Optional, Tuple

import lightning as L
import torch

from litgpt import GPT, Config, PromptStyle, Tokenizer
from litgpt.generate.base import next_token
from litgpt.prompts import has_prompt_style, load_prompt_style
from litgpt.scripts.merge_lora import merge_lora
from litgpt.utils import check_valid_checkpoint_dir, get_default_supported_precision, load_checkpoint


@torch.inference_mode()
def generate(
    model: GPT,
    prompt: torch.Tensor,
    max_returned_tokens: int,
    *,
    temperature: float = 1.0,
    top_k: Optional[int] = None,
    top_p: float = 1.0,
    stop_tokens: Tuple[List[int], ...] = (),
) -> Iterator[torch.Tensor]:
    T = prompt.size(0)
    assert max_returned_tokens > T
    if model.max_seq_length < max_returned_tokens - 1:
        raise NotImplementedError(f"max_seq_length {model.max_seq_length} needs to be >= {max_returned_tokens - 1}")

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    buffer_length = max((len(tokens) for tokens in stop_tokens), default=1)
    yield_i = 0
    input_pos = torch.arange(0, T, device=device)
    tokens = []
    token = prompt
    for t in range(1, max_returned_tokens - T + 1):
        token = next_token(model, input_pos, token.view(1, -1), temperature=temperature, top_k=top_k, top_p=top_p)
        tokens.append(token)
        if any((l := len(st)) <= len(tokens) and all(a == b for a, b in zip(tokens[-l:], st)) for st in stop_tokens):
            return
        if t - yield_i >= buffer_length:
            yield from tokens[yield_i:t]
            yield_i = t
        input_pos = input_pos[-1:].add_(1)


def decode(fabric: L.Fabric, tokenizer: Tokenizer, token_stream: Iterator[torch.Tensor]) -> str:
    decoded_text = ""
    if tokenizer.backend == "huggingface":
        try:
            for token in token_stream:
                decoded_text += tokenizer.decode(token)
        except KeyboardInterrupt:
            return decoded_text
    elif tokenizer.backend == "sentencepiece":
        so_far = torch.tensor([], dtype=torch.long, device=fabric.device)
        try:
            for token in token_stream:
                so_far = so_far.to(device=token.device)
                so_far = torch.cat((so_far, token.view(-1)))
                decoded_text = tokenizer.decode(so_far)
        except KeyboardInterrupt:
            return decoded_text
    else:
        raise NotImplementedError(tokenizer.backend)
    return decoded_text


def process_prompt(prompt, model, tokenizer, prompt_style, fabric, temperature, top_k, top_p, stop_tokens) -> str:
    prompt = prompt_style.apply(prompt=prompt)
    encoded_prompt = tokenizer.encode(prompt, device=fabric.device)
    y = generate(
        model, encoded_prompt, model.max_seq_length, temperature=temperature, top_k=top_k, top_p=top_p, stop_tokens=stop_tokens
    )
    response = decode(fabric, tokenizer, y)
    return response


@torch.inference_mode()
def chat(
    prompt: str,
    checkpoint_dir: str,
    top_k: Optional[int] = 200,
    top_p: float = 1.0,
    temperature: float = 0.8,
    precision: Optional[str] = None
) -> str:
    checkpoint_dir = Path(checkpoint_dir)
    precision = precision or get_default_supported_precision(training=False)

    fabric = L.Fabric(devices=1, precision=precision)

    checkpoint_path = checkpoint_dir / "lit_model.pth"

    if (checkpoint_dir / "lit_model.pth.lora").is_file() and not checkpoint_path.is_file():
        print("Merging LoRA weights with the base model. This won't take long and is a one-time-only thing.")
        merge_lora(checkpoint_dir)

    check_valid_checkpoint_dir(checkpoint_dir)
    config = Config.from_file(checkpoint_dir / "model_config.yaml")

    with fabric.init_module(empty_init=True):
        model = GPT(config)
        model.set_kv_cache(batch_size=1)
    load_checkpoint(fabric, model, checkpoint_path)
    model.eval()

    model = fabric.setup_module(model)

    tokenizer = Tokenizer(checkpoint_dir)
    prompt_style = (
        load_prompt_style(checkpoint_dir) if has_prompt_style(checkpoint_dir) else PromptStyle.from_config(config)
    )
    stop_tokens = prompt_style.stop_tokens(tokenizer)

    L.seed_everything(1234)

    response = process_prompt(
        prompt=prompt,
        model=model,
        tokenizer=tokenizer,
        prompt_style=prompt_style,
        fabric=fabric,
        temperature=temperature,
        top_k=top_k,
        top_p=top_p,
        stop_tokens=stop_tokens
    )
    return response


# phi接口
def phi_chat(prompt):

    response = chat(prompt=prompt,checkpoint_dir="/hpc/home/connect.ytan910/code/checkpoints/microsoft/phi-2",top_k=100,top_p=0.9,temperature=0.7,precision="32-true")
    # response = chat(prompt=prompt,checkpoint_dir="/hpc/home/ytan910@CONNECT/code/checkpoints/microsoft/phi-2",top_k=100,top_p=0.9,temperature=0.7,precision="32-true")
    # print(response)
    return response

# phi finetuning 接口
def phi_fine_chat(prompt):
    response = chat(prompt=prompt,checkpoint_dir="/hpc/home/connect.ytan910/code/LLM_Concolic/finetuning/phi/final",top_k=100,top_p=0.9,temperature=0.7,precision="32-true")
    return response



# TinyLLama接口
def tiny_chat(prompt):
    response = chat(prompt=prompt,checkpoint_dir="/hpc/home/connect.ytan910/code/checkpoints/TinyLlama/TinyLlama-1.1B-intermediate-step-1431k-3T",top_k=100,top_p=0.9,temperature=0.7,precision="32-true")
    return response

# TinyLLama接口
def tiny_fine_chat(prompt):
    response = chat(prompt=prompt,checkpoint_dir="/hpc/home/connect.ytan910/code/LLM_Concolic/finetuning/tiny/final",top_k=100,top_p=0.9,temperature=0.7,precision="32-true")
    return response


# gpt接口
def chat_gpt(prompt):
    data = { 
        "model": "gpt-3.5-turbo", 
        "messages": [{"role": "user", "content": prompt}], 
        "temperature": 0.7 
    }
    response = requests.post(url, headers=headers, data=json.dumps(data))
    response_json = response.json()
    if 'choices' not in response_json:
        print("No Reponse")
        return None
    else:
        reply_content = response_json['choices'][0]['message']['content'] 
        return reply_content
    

def extract_and_convert_to_list(text):
    # 匹配任意形式的列表内容，包括方括号或逗号分隔的数字
    # matches = re.findall(r'[\[\(]?\s*([\d\s,]+)\s*[\]\)]?', text)
    matches = re.findall(r'<\s*([\w\s,]*)\s*>', text)
    
    all_numbers = []
    for match in matches:
        # 将匹配的部分分割成一个列表，并处理每个元素
        items = re.split(r'\s*,\s*', match.strip())
        for item in items:
            if item.isdigit():  # 检查是否为数字
                all_numbers.append(int(item))
    return all_numbers
    

    

def save_as_json(prompt, reply):
    filename = os.path.join(os.getcwd(), 'finetuning.json')
    
    # 检查文件是否存在并且非空
    if os.path.exists(filename) and os.path.getsize(filename) > 0:
        with open(filename, 'r') as file:
            try:
                data = json.load(file)
                if not isinstance(data, list):
                    data = [data]
            except json.JSONDecodeError:
                # 如果文件内容不是有效的 JSON 格式，初始化为一个空列表
                data = []
    else:
        data = []

    # 新的数据
    new_entry = {
        "instruction": prompt,
        "input": " ",
        "output": reply
    }
    
    
    # 添加新数据到列表
    data.append(new_entry)
    
    # 写回文件
    with open(filename, 'w') as file:
        json.dump(data, file, indent=4)

def save_finetune(prompt, reply):
    filename = os.path.join(os.getcwd(), 'data.json')
    
    # 检查文件是否存在并且非空
    if os.path.exists(filename) and os.path.getsize(filename) > 0:
        with open(filename, 'r') as file:
            try:
                data = json.load(file)
                if not isinstance(data, list):
                    data = [data]
            except json.JSONDecodeError:
                # 如果文件内容不是有效的 JSON 格式，初始化为一个空列表
                data = []
    else:
        data = []
    # 新的数据
    new_entry = {
        "instruction": prompt,
        "input": " ",
        "output": reply
    }
    
    # 添加新数据到列表
    data.append(new_entry)
    
    # 写回文件
    with open(filename, 'w') as file:
        json.dump(data, file, indent=4)


def random_list(index_length):
    
    sort_list = list(range(index_length))
    random.shuffle(sort_list)
    
    return sort_list

def pad_list(sort_list, index_length):
    seen = set()
    unique_ordered_list = []
    
    for item in sort_list:
        if item < index_length and item not in seen:
            seen.add(item)
            unique_ordered_list.append(item)
    
    full_range = set(range(index_length))
    missing_values = sorted(full_range - seen)
    
    unique_ordered_list.extend(missing_values)
    
    return unique_ordered_list