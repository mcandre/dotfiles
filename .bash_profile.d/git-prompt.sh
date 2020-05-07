#!/bin/sh
#
# This loader depends on
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
. "$HOME/git-prompt.sh" && export PS1='\W$(__git_ps1 " (%s)")$ '
