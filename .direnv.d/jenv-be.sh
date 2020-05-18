#!/bin/sh

export PATH="$PATH:$HOME/.jenv/bin"

if command -v jenv >/dev/null 2>&1; then
    eval "$(jenv init - bash)"
fi
