#!/bin/bash
export PATH="$PATH:$HOME/.jenv/bin"
if which jenv >/dev/null; then eval "$(jenv init - bash)"; fi
