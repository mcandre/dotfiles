#!/bin/bash

[ -e "$HOME/.bashrc" ] && . "$HOME/.bashrc"

[ -e "$HOME/.bash_profile.d" ] && for f in $(find "$HOME/.bash_profile.d/enabled" -type f -o -type l); do
    if [[ -x "$f" ]]; then
        . "$f"
    fi
done
