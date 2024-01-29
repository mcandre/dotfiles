#!/bin/sh

# shellcheck source=/dev/null
[ -s "$HOME/.gvm/scripts/gvm" ] &&
    . "$HOME/.gvm/scripts/gvm"

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
