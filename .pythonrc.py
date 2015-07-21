# ln -s .../python.sh ~/.bashrc.d/enabled/python.sh
# ln -s .../.pythonrc.py ~/.pythonrc.py

# Add tab completion and session history to REPL

import readline
import rlcompleter
readline.parse_and_bind("tab: complete")

#
# Persist history across sessions
#

import atexit
import os

history_path = os.path.expanduser("~/.pyhistory")

def save_history(history_path = history_path):
    import readline
    readline.write_history_file(history_path)

if os.path.exists(history_path):
    readline.read_history_file(history_path)

atexit.register(save_history)

# Clear variables from REPL
del os, atexit, readline, rlcompleter, save_history, history_path
