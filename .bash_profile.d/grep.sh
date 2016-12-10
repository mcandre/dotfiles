#!/bin/sh

export GREP_OPTIONS='--color=auto'
alias grep='grep --exclude-dir .git --exclude-dir node_modules -n'
