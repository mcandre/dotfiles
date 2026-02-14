if [ -f "$HOME/.dircolors" ]; then
    eval "$(dircolors -b "$HOME/.dircolors")"
fi

# Enable file mode color coding where available
alias ls='ls --color=auto'

# https://monokai.pro/zsh
export CLICOLOR=1
export LSCOLORS=gxfxexdxcxegedabagacad
