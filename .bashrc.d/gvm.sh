#!/bin/bash

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
