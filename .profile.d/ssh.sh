#!/bin/sh

DISABLE_IPV6=''

if [ -r /proc/version ] && grep 'Microsoft' /proc/version >/dev/null; then
    # shellcheck disable=SC2034
    DISABLE_IPV6='-4'
fi

# Recursive, aggregate progress
alias ssh='ssh ${DISABLE_IPV6}'
