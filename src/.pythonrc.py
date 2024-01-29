#
# Add tab completion and session history to REPL
#
# ln -s .../python.sh ~/.bashrc.d/enabled/python.sh
# ln -s .../.pythonrc.py ~/.pythonrc.py

import readline
import rlcompleter
import atexit
import os

#
# Persist history across sessions
#

history_path = os.path.expanduser('~/.pyhistory')


def save_history(history_path=history_path):
    import readline
    readline.write_history_file(history_path)

if os.path.exists(history_path):
    readline.read_history_file(history_path)

atexit.register(save_history)

readline.parse_and_bind('tab: complete')

# Clear variables from REPL
del os, atexit, readline, rlcompleter, save_history, history_path
