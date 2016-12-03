#!/bin/bash

# Colorize soft links
LS='ls'

if [[ "$(uname -s)" =~ Darwin ]]; then
    LS='gls'
fi

export LS

alias ls='$LS --color=auto'
