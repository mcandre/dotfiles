#!/bin/sh

. "$HOME/svn-prompt.sh"
export PS1='\W$(parse_svn_branch)$ '
