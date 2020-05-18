#!/bin/zsh
if [ -r "$(brew --prefix)/etc/zsh_completion" ]; then
    . "$(brew --prefix)/etc/zsh_completion"
fi
