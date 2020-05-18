#!/bin/bash
# Note: non-interactive configuration can be done in $BASH_ENV file path.

# shellcheck source=/dev/null
[ -r "$HOME/.profile" ] &&
    . "$HOME/.profile"

[ -z "$(find "$HOME/.bashrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in "$HOME/.bashrc.d/enabled"/*; do
        # shellcheck source=/dev/null
        . "$f"
    done

command -v direnv >/dev/null 2>&1 &&
    eval "$(direnv hook bash)" &&
    export DIRENV_LOG_FORMAT= &&
    direnv reload
