#!/bin/zsh
#
# This loader depends on
# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
. "$HOME/git-prompt.sh" && setopt PROMPT_SUBST ; PS1='%c$(__git_ps1 " (%s)")\$ '
