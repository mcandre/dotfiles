autoload -U colors
colors
. ~/.monokai.zsh
PROMPT="%B%F{$MONOKAI}%#%f%b "
PROMPT_EOL_MARK=''
zle_highlight=("default:fg=$MONOKAI,bold")
