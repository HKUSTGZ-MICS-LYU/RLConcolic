
class global_variable:
    first_explore_label = True
    branch_dim = None
    state_dim = None
    target = None
    branch = None
    assign_type = None
    search_time = 0
    explore_time = 0
    begin_clock = 0
    def add_target(target):
        global_variable.target = target

    def get_target():
        return global_variable.target

    def clear_target():
        global_variable.target = None

