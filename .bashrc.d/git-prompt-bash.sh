#!/bin/sh
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

# shellcheck source=/dev/null
. "$HOME/git-prompt.sh" &&
    export PS1='\W$(__git_ps1 " (%s)")$ '
