if [ "$INSIDE_EMACS" ]; then
  . "$HOME/git-prompt.sh" && PROMPT_COMMAND='' && export PS1='$(__git_ps1 "(%s)")$ '
else
  . "$HOME/git-prompt.sh" && export PS1='\W$(__git_ps1 " (%s)")$ '
fi
