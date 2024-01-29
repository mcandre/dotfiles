#!/bin/sh

# shellcheck source=/dev/null
if [ -r "$(brew --prefix)/etc/bash_completion" ]; then
    # shellcheck source=/dev/null
    . "$(brew --prefix)/etc/bash_completion"
fi
