"""Run with python -m unittest discover -s tests -v.

RTL smoke tests run in fresh processes and temporary directories. They verify
actual learning and replayed coverage, not just a successful process exit.
"""
import json
import os
from pathlib import Path
import random
import shutil
import subprocess
import sys
import tempfile
from types import SimpleNamespace
import unittest
from unittest.mock import patch

import numpy as np
import torch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / 'src'))
from DQN import DQN


def run_design(design):
    """Configure the existing Globals interface before importing the driver."""
    import Globals
    config = Globals.configurations[design]
    Globals.testbench = design
    for name in ('top_module', 'clk_name', 'reset_name', 'reset_edge'):
        setattr(Globals, name, config[name])
    Globals.file_pth = config['file_path']
    Globals.folder_pth = str(Path(Globals.file_pth).parent) + '/'
    for name, filename in (
        ('dut_file', 'conquest_dut.v'), ('tb_file', 'conquest_tb.v'),
        ('multi_tb_file', 'conquest_tb_multi.v'),
        ('target_pth', 'target_constraints.txt'),
    ):
        setattr(Globals, name, Globals.folder_pth + filename)
    Globals.unroll = 20
    Globals.random_sim = 1
    random.seed(42)
    np.random.seed(42)
    torch.manual_seed(42)

    import main
    from SMTlib import SMTBasicBlock, SMTBranch
    from Utilies import StateVariable
    metrics = dict(updates=0, actor_changed=False, critic_changed=False,
                   different_states=0, finite=True)
    original_update = DQN.update

    def checked_update(agent, transition):
        actor = [p.detach().clone() for p in agent.actor.parameters()]
        critic = [p.detach().clone() for p in agent.critic.parameters()]
        original_update(agent, transition)
        metrics['updates'] += 1
        metrics['actor_changed'] |= any(
            not torch.equal(a, b) for a, b in zip(actor, agent.actor.parameters()))
        metrics['critic_changed'] |= any(
            not torch.equal(a, b) for a, b in zip(critic, agent.critic.parameters()))
        metrics['different_states'] += int(not np.array_equal(
            transition['states'], transition['next_states']))
        metrics['finite'] &= all(torch.isfinite(p).all().item() for p in
                                list(agent.actor.parameters()) + list(agent.critic.parameters()))

    with patch.object(DQN, 'update', checked_update):
        main.Concolic(Globals.file_pth, Globals.top_module, Globals.clk_name,
                      Globals.reset_name, Globals.reset_edge, Globals.unroll,
                      Globals.steps, Globals.limit_iter, Globals.random_sim).main()

    folder = Path(Globals.folder_pth)
    branches = {int(line) for line in (folder / 'branch_id.txt').read_text().splitlines()}
    covered = {branch.id for branch in SMTBranch._all_branches_list
               if branch.covered_at_clock == 0}
    for line in (folder / 'mergesim.log').read_text().splitlines():
        if line.startswith(';A '):
            covered.add(int(line.split()[1]))
    tracked = {assign.id for target in SMTBasicBlock._covered_target_list
               for assign in target.assign_list if assign.id in branches}
    metrics.update(total=len(branches), replayed=len(covered & branches),
                   coverage_matches=(tracked == covered & branches),
                   state_dim=len(StateVariable.get_names()))
    Path('metrics.json').write_text(json.dumps(metrics, indent=2))
    print('RL_METRICS', json.dumps(metrics), flush=True)


class AgentTests(unittest.TestCase):
    def test_policy_rank_takes_priority_over_clock(self):
        agent = DQN(2, 8, 0.01, 0.9, 0.5, 1, torch.device('cpu'))
        with torch.no_grad():
            for parameter in agent.actor.parameters():
                parameter.zero_()
            agent.actor.fc2.bias[7] = 2
        early = SimpleNamespace(constraint=SimpleNamespace(clock=1))
        late = SimpleNamespace(constraint=SimpleNamespace(clock=9))
        self.assertEqual(agent.take_action(np.array([0, 1]), {2: [early], 7: [late]}),
                         [late, early])
        self.assertEqual(agent.take_action(np.array([0, 1]), {}), [])

    def test_sparse_branch_ids_fit_agent_output(self):
        import Simulate
        with patch.object(Simulate, 'compile'), \
             patch.object(Simulate, 'count_registers', return_value=2), \
             patch.object(Simulate.SMTBranch, '_all_branches_list',
                          [SimpleNamespace(id=2), SimpleNamespace(id=7)]), \
             patch.object(Simulate, 'dqn_agent'), \
             patch.object(Simulate.global_variable, 'branch_dim'), \
             patch.object(Simulate.global_variable, 'state_dim'):
            Simulate.init()
            self.assertEqual(Simulate.global_variable.branch_dim, 8)
            self.assertIsNone(Simulate.dqn_agent)

    def test_replay_refreshes_states_and_stops_at_eof(self):
        import Simulate
        with tempfile.TemporaryDirectory() as folder, \
             patch.object(Simulate, 'sim'), \
             patch.object(Simulate, 'folder_pth', folder + '/'), \
             patch.object(Simulate.StateVariable, '_all_states', {'stale': {100: '9'}}):
            Path(folder, 'sim.log').write_text(';R flag = 2\n;_C 1\n;R flag = 5\n')
            Simulate.sim_not_cnst()
            self.assertEqual(Simulate.StateVariable._all_states,
                             {'flag': {0: '2', 1: '5'}})


@unittest.skipUnless(shutil.which('iverilog') and shutil.which('vvp'),
                     'Icarus Verilog is required for RTL smoke tests')
class RTLSmokeTests(unittest.TestCase):
    def check_design(self, design):
        workdir = Path(tempfile.mkdtemp(prefix=f'rlconcolic-test-{design}-'))
        design_dir = workdir / 'test' / design
        design_dir.mkdir(parents=True)
        shutil.copyfile(ROOT / 'test' / design / f'{design}.v', design_dir / f'{design}.v')
        env = dict(os.environ, PYTHONHASHSEED='0')
        with (workdir / 'run.log').open('w') as log:
            result = subprocess.run([sys.executable, '-u', __file__, '--design', design],
                                    cwd=workdir, env=env, stdout=log,
                                    stderr=subprocess.STDOUT, timeout=90)
        output = (workdir / 'run.log').read_text()
        self.assertEqual(result.returncode, 0, output[-8000:])
        metrics = json.loads((workdir / 'metrics.json').read_text())
        self.assertGreater(metrics['updates'], 0)
        self.assertTrue(metrics['actor_changed'])
        self.assertTrue(metrics['critic_changed'])
        self.assertTrue(metrics['finite'])
        self.assertGreater(metrics['different_states'], 0)
        self.assertGreater(metrics['state_dim'], 1)
        self.assertTrue(metrics['coverage_matches'], metrics)
        self.assertIn('Double checking branch coverage', output)
        self.assertTrue((design_dir / 'multisim.log').stat().st_size)
        for log_path in design_dir.rglob('*.log'):
            self.assertNotIn('ERROR:', log_path.read_text(), str(log_path))
        print(f'\n{design}: {json.dumps(metrics)}; artifacts: {workdir}', flush=True)

    def test_b06(self):
        self.check_design('b06')

    def test_b11(self):
        self.check_design('b11')


if __name__ == '__main__':
    if len(sys.argv) == 3 and sys.argv[1] == '--design':
        run_design(sys.argv[2])
    else:
        unittest.main()
