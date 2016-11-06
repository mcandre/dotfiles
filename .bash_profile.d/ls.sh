# Colorize soft links
LS='ls'

if [[ "$(uname -s)" =~ 'Darwin' ]]; then
    LS='gls'
fi

alias ls="$LS --color=auto"
