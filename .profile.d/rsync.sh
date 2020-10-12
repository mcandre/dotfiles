#!/bin/sh

DISABLE_IPV6=''

if [ -r /proc/version ] && grep 'Microsoft' /proc/version >/dev/null; then
    # shellcheck disable=SC2034
    DISABLE_IPV6='-4'
fi

# Recursive, 1MB/sec throttle, aggregate progress
alias rsync='rsync ${DISABLE_IPV6} -a --bwlimit 1000 --info progress2'
