#!/bin/sh

DISABLE_IPV6=''

if [ -r /proc/version ] && grep 'Microsoft' /proc/version >/dev/null; then
    # shellcheck disable=SC2034
    DISABLE_IPV6='-4'
fi

# Work around zsh tab completion foibles
DISABLE_NEW_ARGS='--old-args'

# Recursive, aggregate progress
alias rsync='rsync ${DISABLE_IPV6} ${DISABLE_NEW_ARGS} -a --info progress2'
