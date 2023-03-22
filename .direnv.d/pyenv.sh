#!/bin/sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Fix Ansible
ANSIBLE_PYTHON_INTERPRETER="$(which python)"
export ANSIBLE_PYTHON_INTERPRETER
