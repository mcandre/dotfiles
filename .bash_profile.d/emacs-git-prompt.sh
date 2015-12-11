[ "$INSIDE_EMACS" ] && . "$HOME/git-prompt.sh" && PROMPT_COMMAND='' && export PS1='\W$(__git_ps1 " (%s)")$ '
