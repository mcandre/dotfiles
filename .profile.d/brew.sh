#!/bin/sh

# Add Homebrew
unset INFOPATH
unset MANPATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# Workaround brew updated cabal vs cabal updated cabal
PATH="$HOME/.cask/bin:$PATH"

# Workaround pyenv shims vs. brew doctor
if command -v pyenv >/dev/null; then
    alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
fi

# Prefer GNU findutils
# shellcheck source=/dev/null
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# Prefer GNU make
# shellcheck source=/dev/null
PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"
