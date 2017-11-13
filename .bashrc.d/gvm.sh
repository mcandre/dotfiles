#!/bin/sh

[ -s "$HOME/.gvm/scripts/gvm" ] && . "$HOME/.gvm/scripts/gvm"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
