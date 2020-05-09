#!/bin/bash

. "$HOME/git-prompt.sh" && . "$HOME/svn-prompt.sh"
export PS1='\W$(__git_ps1 " (%s)")$(parse_svn_branch)$ '
