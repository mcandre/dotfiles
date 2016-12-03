#!/bin/bash

[ -e "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [ -e "$HOME/.bash_profile.d" ]; then
    SCRIPTS=$(find "$HOME/.bash_profile.d/enabled" -type f -o -type l)
    for f in $SCRIPTS; do
        if [[ -x "$f" ]]; then
            . "$f"
        fi
    done
fi
