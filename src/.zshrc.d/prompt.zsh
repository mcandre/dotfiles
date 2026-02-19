autoload -U colors
colors
MONOKAI='148' # 8 bit ANSI ; 24 bit #AFD700
PROMPT="%B%F{$MONOKAI}%#%f%b "
PROMPT_EOL_MARK=''
zle_highlight=("default:fg=$MONOKAI,bold")
