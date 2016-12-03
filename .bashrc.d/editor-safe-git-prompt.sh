#!/bin/sh

if [ "$INSIDE_EMACS" -o "$VIMRUNTIME" ]; then
    PROMPT_COMMAND='' && export PS1='$ '
else
    . "$HOME/git-prompt.sh" && export PS1='\W$(__git_ps1 " (%s)")$ '
fi
