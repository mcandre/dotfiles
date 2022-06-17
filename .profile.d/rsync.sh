#!/bin/sh

DISABLE_IPV6=''

if [ -r /proc/version ] && grep 'Microsoft' /proc/version >/dev/null; then
    # shellcheck disable=SC2034
    DISABLE_IPV6='-4'
fi

DISABLE_NEW_ARGS=''

DISTRO="$(uname -a)"

case "$DISTRO" in
    Darwin*)
        DISABLE_NEW_ARGS='--old-args'
        ;;
    *)
        ;;
esac

# Recursive, aggregate progress
alias rsync='rsync ${DISABLE_IPV6} ${DISABLE_NEW_ARGS} -a --info progress2'
