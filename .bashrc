#!/bin/bash

PATH='/usr/bin:/bin:/usr/sbin:/sbin'

if [ -e "$HOME/.bashrc.d" ]; then
    SCRIPTS="$(find "$HOME/.bashrc.d/enabled" -type f -o -type l)"
    for f in $SCRIPTS; do
        if [[ -x "$f" ]]; then
            . "$f"
        fi
    done
fi

type direnv &> /dev/null
if [ "$?" -eq 0 ]; then
    eval "$(direnv hook bash)"
    export DIRENV_LOG_FORMAT=''
fi

if [ -n "$VIMRUNTIME" ]; then
    direnv reload
    . "$HOME/.vim_bash"
fi
