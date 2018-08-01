#!/bin/bash

PATH="/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$HOME/local/sbin:$PATH"
PATH="$HOME/.cask/bin:$PATH"

# E.g., brew install git
if [ -r "$(brew --prefix)/etc/bash_completion" ]; then
    . "$(brew --prefix)/etc/bash_completion"
fi

# Workaround pyenv shims vs. brew doctor
type pyenv &>/dev/null
if [ "$?" -eq 0 ]; then
    alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
fi

# Workaround brew updated cabal vs cabal updated cabal
export PATH="$HOME/.cabal/bin:$PATH"
