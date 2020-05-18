#!/bin/zsh

# shellcheck source=/dev/null
if [ -r "$(brew --prefix)/etc/zsh_completion" ]; then
    # shellcheck source=/dev/null
    . "$(brew --prefix)/etc/zsh_completion"
fi
