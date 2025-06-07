import torch
import re
import numpy as np
import random
import collections
import pickle
import os
from torch.nn import functional as F
import warnings
import time
import collections
import random

# DQN参数
learning_rate = 0.1
gamma = 0.9
epsilon = 0.5
target_update = 1
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
done = False


# 忽略所有警告
warnings.filterwarnings("ignore")

def sort_and_filter_branches(branch_dict):
    branch_list = [br for br_list in branch_dict.values() for br in br_list ]
    branch_list.sort(key=lambda br: (br.br.block.distance, br.constraint.clock))
    branches_by_id = {}
    for br in branch_list:
        branch_id = br.br.block.assign_list[0].id
        if branch_id not in branches_by_id:
            branches_by_id[branch_id] = []
        branches_by_id[branch_id].append(br)

    filtered_branches = []
    for branch_id, br_list in branches_by_id.items():
        # 如果 br_list 长度大于 3，保留最小、中间、最大 clk
        if len(br_list) > 3:
            min_br = br_list[0]  
            max_br = br_list[-1]  
            # 选择中间的 clk，如果有多个中间值，随机选择一个
            mid_index = len(br_list) // 2
            mid_br = br_list[mid_index] if len(br_list) % 2 == 1 else random.choice(br_list[mid_index-1:mid_index+1])
            # filtered_branches.extend([mid_br,max_br,min_br])
            filtered_branches.extend([mid_br])
        elif len(br_list) == 2:
            filtered_branches.extend(reversed(br_list))
            # filtered_branches.extend(reversed(br_list[0]))
        else:
            filtered_branches.extend(br_list)
    sorted_filtered_branches = sorted(filtered_branches, key=lambda br: (br.br.block.distance,br.constraint.clock,))
    
    return sorted_filtered_branches

# def sort_and_filter_branches(branch_dict):
#     # Flatten all branches into a list
#     branch_list = [br for br_list in branch_dict.values() for br in br_list]

#     # Sort branches first by distance, then by clock
#     branch_list.sort(key=lambda br: (br.br.block.distance, br.constraint.clock))

#     # Organize branches by id
#     branches_by_id = {}
#     for br in branch_list:
#         branch_id = br.br.block.assign_list[0].id
#         if branch_id not in branches_by_id:
#             branches_by_id[branch_id] = []
#         branches_by_id[branch_id].append(br)

#     filtered_branches = []
#     for branch_id, br_list in branches_by_id.items():
#         if len(br_list) > 3:
#             # Divide branches into three parts: smallest, middle, and largest
#             third_len = len(br_list) // 3
            
#             smallest_part = br_list[:third_len]  # First third
#             largest_part = br_list[-third_len:]  # Last third
#             middle_part = br_list[third_len:-third_len]  # Middle part

#             # Randomly select one from each part if middle part is not empty
#             if middle_part:
#                 mid_br = random.choice(middle_part)
#             else:
#                 mid_br = random.choice(smallest_part + largest_part)
            
#             # Select one from smallest and largest parts
#             min_br = random.choice(smallest_part)
#             max_br = random.choice(largest_part)
            
#             filtered_branches.extend([max_br, mid_br, min_br])
#         else:
#             # Retain all branches if the list has 3 or fewer branches
#             filtered_branches.extend(br_list)

#     # Final sorting by distance and clock
#     sorted_filtered_branches = sorted(filtered_branches, key=lambda br: (br.br.block.distance, br.constraint.clock))
    
#     return sorted_filtered_branches


def sort_by_distance(branch_dict):
    # branch_list = [br for br_list in branch_dict.values() for br in br_list if br.br.block.distance < 8]
    branch_list = [br for br_list in branch_dict.values() for br in br_list ]
    branch_list.sort(key=lambda br: br.br.block.distance)
    branch_list.sort(key=lambda item: item.constraint.clock, reverse=True)

    # print("Sort Distance Branches:", list({item.br.block.assign_list[0].id for item in branch_list}))
    return branch_list

def sort_by_random(branch_dict):
    branch_list = [br for br_list in branch_dict.values() for br in br_list ]
    random.shuffle(branch_list)
    branch_list.sort(key=lambda item: item.constraint.clock)
    # print("Random Branches:", list({item.br.block.assign_list[0].id for item in branch_list}))
    return branch_list

def sort_by_test(branch_dict,test_num):
    branch_list = [br for br_list in branch_dict.values() for br in br_list ]
    branch_list.sort(key=lambda item: (item.constraint.assign_id, abs(int(item.constraint.assign_id) - test_num)))
    branch_list.sort(key=lambda item: item.constraint.clock)
    # print("Random Branches:", list({item.br.block.assign_list[0].id for item in branch_list}))
    return branch_list

class PolicyNet(torch.nn.Module):
    def __init__(self, state_dim, action_dim):
        super(PolicyNet, self).__init__()
        self.fc1 =  torch.nn.Linear(state_dim, 128)
        self.fc2 =  torch.nn.Linear(128, action_dim)

    
    def forward(self, x):
        x = F.relu(self.fc1(x))
        return F.softmax(self.fc2(x), dim=-1)
    

class ValueNet(torch.nn.Module):
    def __init__(self, state_dim):
        super(ValueNet, self).__init__()
        self.fc1 =  torch.nn.Linear(state_dim, 128)
        self.fc2 =  torch.nn.Linear(128, 1)

    
    def forward(self, x):
        x = F.relu(self.fc1(x))
        return self.fc2(x)
    
class DQN:
    ''' DQN algorithm '''
    def __init__(self, state_dim, action_dim, learning_rate, gamma, epsilon, target_update, device):
            self.actor = PolicyNet(state_dim,action_dim).to(device)
            self.critic = ValueNet(state_dim).to(device) 
            self.actor_optimizer = torch.optim.Adam(self.actor.parameters(),lr=learning_rate)
            self.critic_optimizer = torch.optim.Adam(self.critic.parameters(),lr=learning_rate)
            self.gamma = gamma  
            self.device = device
            self.action_dim = action_dim
            self.epsilon = epsilon  
            self.target_update = target_update  
            self.action_dim = action_dim

    

    def take_action(self, state, branch_dict):
        state_tensor = torch.tensor([state], dtype=torch.float).to(self.device)
        with torch.no_grad():  
            action_probs = self.actor(state_tensor)
            # action_probs = action_probs.squeeze() #policy_net输出的是一个batch的数据，所以要squeeze
            action_probs = action_probs.cpu().numpy()  

        sorted_indices = np.argsort(action_probs[0])[::-1]
        # print("DQN Sorted Indices:", sorted_indices)
        sorted_branches = []
        
    
        for id in sorted_indices:
            if id in list(branch_dict.keys()) :
                sorted_branches += branch_dict[id]
        

        # print("DQN Sorted Branches:", list({item.br.block.assign_list[0].id for item in sorted_branches})) 
        sorted_branches.sort(key=lambda item: item.constraint.clock)
        return sorted_branches
    
    # def take_action(self, state, branch_dict):
    #     state_tensor = torch.tensor([state], dtype=torch.float).to(self.device)
    #     with torch.no_grad():  
    #         action_probs = self.actor(state_tensor)
    #         action_probs = action_probs.squeeze() #policy_net输出的是一个batch的数据，所以要squeeze

    #     action_dist = torch.distributions.Categorical(action_probs)
    #     sorted_actions = []
    #     while len(sorted_actions) < len(branch_dict):
    #         action = action_dist.sample().item()
    #         if action in branch_dict.keys():
    #             sorted_actions.append(action)

    #     sorted_branches = []
    #     for action in sorted_actions:
    #         sorted_branches += branch_dict[action]
    #     print("Sorted Branches:", list({item.br.block.assign_list[0].id for item in sorted_branches}))
    #     return sorted_branches


    # def update(self, state, action, reward, next_state, done):
        
    #     state_tensor = torch.tensor([state], dtype=torch.float).to(self.device)
    #     action_tensor = torch.tensor([action], dtype=torch.int64).view(-1, 1).to(self.device)
    #     # reward = self.penalize_action(action, reward)
    #     reward_tensor = torch.tensor([reward], dtype=torch.float).view(-1, 1).to(self.device)
    #     next_state_tensor = torch.tensor([next_state], dtype=torch.float).to(self.device)
    #     done_tensor = torch.tensor([done], dtype=torch.float).view(-1, 1).to(self.device)
        
        
    #     q_values = self.q_net(state_tensor).gather(1, action_tensor)
    #     max_next_q_values = self.target_q_net(next_state_tensor).max(1)[0].view(-1, 1)
    #     q_targets = reward_tensor + self.gamma * max_next_q_values * (1 - done_tensor)


    #     dqn_loss = torch.mean(F.mse_loss(q_values, q_targets))
    #     # print("Action:", action, "Reward:", reward)
    #     self.optimizer.zero_grad()
    #     dqn_loss.backward()
    #     self.optimizer.step()
    #     if self.count % self.target_update == 0:
    #         self.target_q_net.load_state_dict(self.q_net.state_dict())


    def update(self, transition_dict):
        states = torch.tensor(transition_dict['states'],dtype=torch.float).to(self.device)
        actions = torch.tensor(transition_dict['actions']).view(-1, 1).to(self.device)
        rewards = torch.tensor(transition_dict['rewards'],dtype=torch.float).view(-1, 1).to(self.device)
        next_states = torch.tensor(transition_dict['next_states'],dtype=torch.float).to(self.device)

        # 时序差分目标
        td_target = rewards + self.gamma * self.critic(next_states) 
        td_delta = td_target - self.critic(states)  # 时序差分误差
        log_probs = torch.log(self.actor(states).gather(1, actions))
        actor_loss = torch.mean(-log_probs * td_delta.detach())
        # 均方误差损失函数
        critic_loss = torch.mean(
            F.mse_loss(self.critic(states), td_target.detach()))
        self.actor_optimizer.zero_grad()
        self.critic_optimizer.zero_grad()
        actor_loss.backward()  # 计算策略网络的梯度
        critic_loss.backward()  # 计算价值网络的梯度
        self.actor_optimizer.step()  # 更新策略网络的参数
        self.critic_optimizer.step()  # 更新价值网络的参数