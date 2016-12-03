#!/bin/sh

IN_EDITOR=0

if [ -n "$INSIDE_EMACS" ]; then
    IN_EDITOR=1
fi

if [ -n "$VIMRUNTIME" ]; then
    IN_EDITOR=1
fi

if [ $IN_EDITOR -eq 1 ]; then
    PROMPT_COMMAND='' && export PS1='$ '
else
    . "$HOME/git-prompt.sh" && export PS1='\W$(__git_ps1 " (%s)")$ '
fi
