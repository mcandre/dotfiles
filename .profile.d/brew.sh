#!/bin/sh

# Add Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$HOME/local/bin:$HOME/local/sbin:$PATH"

# Workaround brew updated cabal vs cabal updated cabal
PATH="$HOME/.cask/bin:$PATH"

# Workaround pyenv shims vs. brew doctor
if command -v pyenv >/dev/null; then
    alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
fi

# Prefer GNU findutils
# shellcheck source=/dev/null
PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH"

# Prefer newer LLVM with fuzzing enabled
# shellcheck source=/dev/null
export CC='clang'
export CXX='clang++'
export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
PATH="$(brew --prefix)/opt/llvm/bin:$PATH"

export PATH
