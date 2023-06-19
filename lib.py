import subprocess
from pathlib import Path


def define_env(env):
    @env.macro
    def run_script(script):
        return subprocess.run(script, shell=True, check=True, capture_output=True, text=True).stdout
