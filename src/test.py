import re
import random
def extract_and_convert_to_list(text):
    # 匹配任意形式的列表内容，包括方括号或逗号分隔的数字
    matches = re.findall(r'[\[\(]?\s*([\d\s,]+)\s*[\]\)]?', text)
    
    all_numbers = []
    for match in matches:
        # 将匹配的部分分割成一个列表，并处理每个元素
        items = re.split(r'\s*,\s*', match.strip())
        for item in items:
            if item.isdigit():  # 检查是否为数字
                all_numbers.append(int(item))
    return all_numbers

def pad_list(sort_list, index_length):
    
    sort_list = [item for item in sort_list if item < index_length]
    sort_set = set(sort_list)
    full_range = set(range(index_length))
    missing_values = full_range - sort_set
    sort_list.extend(random.sample(missing_values, len(missing_values)))
    # random.shuffle(sort_list)
    
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

test = [0, 0, 0, 4, 0, 2, 0, 0, 1, 1, 2, 0, 3, 0, 4, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 1, 0, 0, 0, 2, 0, 0, 1, 1, 2, 0, 3, 0, 4, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 2, 0, 0, 2, 2, 0, 0, 1, 1, 2, 0, 3, 0, 4, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 3, 0, 1, 2, 2, 0, 0, 1, 1, 2, 0, 3, 0, 4, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 4, 0]
print(pad_list(test,6))