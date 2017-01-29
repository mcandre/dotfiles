#!/bin/bash

export PATH='/usr/bin:/bin:/usr/sbin:/sbin'

if [ -e "$HOME/.bashrc.d" ]; then
    SCRIPTS=$(find "$HOME/.bashrc.d/enabled" -name '*.sh' -print)
    for f in $SCRIPTS; do
        if [[ -r "$f" ]]; then
            . "$f"
        fi
    done
fi

type direnv &> /dev/null
if [ "$?" -eq 0 ]; then
    eval "$(direnv hook bash)"
    export DIRENV_LOG_FORMAT=''
    direnv reload
fi

# pupsay
export PATH="$PATH:$HOME/go/src/github.com/mcandre/toys/sh/lib"
