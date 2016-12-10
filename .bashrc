#!/bin/bash

PATH='/usr/bin:/bin:/usr/sbin:/sbin'

if [ -e "$HOME/.bashrc.d" ]; then
    SCRIPTS=$(find "$HOME/.bashrc.d/enabled" -name '*.sh' )
    for f in $SCRIPTS; do
        if [[ -r "$f" ]]; then
            . "$f"
        fi
    done
fi

if [ -e "$HOME/.bash_profile.d" ]; then
    SCRIPTS=$(find "$HOME/.bash_profile.d/enabled" -name '*.sh' )
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
fi

if [ -n "$VIMRUNTIME" ]; then
    direnv reload
    . "$HOME/.vim_bash"
fi
