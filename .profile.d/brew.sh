#!/bin/sh

PATH="/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$HOME/local/sbin:$PATH"
PATH="$HOME/.cask/bin:$PATH"

# Workaround pyenv shims vs. brew doctor
if command -v pyenv >/dev/null; then
    alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
fi

# Prefer GNU findutils
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# Workaround brew updated cabal vs cabal updated cabal
export PATH="$HOME/.cabal/bin:$PATH"
