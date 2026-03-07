# # Begin profiling
# zmodload zsh/zprof

. ~/.zshenv

# Quiet
setopt nobeep

# Prompt
autoload -U colors
colors
MONOKAI='148' # 8 bit ANSI ; 24 bit #AFD700
PROMPT="%B%F{$MONOKAI}%#%f%b "
PROMPT_EOL_MARK=''
zle_highlight=("default:fg=$MONOKAI,bold")

# Title
precmd () {
    print -Pn "\e]0;%1d\a"
}

# Block cd typos
cd () {
    builtin cd "${1:-"$(pwd)"}"
}

# History
setopt BANG_HIST
setopt append_history
setopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=8000

# ls colorize
alias ls='ls --color=auto'

# ll show useful file path metadata
alias ll='ls -Ahl'

# tree show hidden files
alias tree='tree -a'

#
# Pagers
#
# Monokai theme
export LESS_TERMCAP_mb=$'\e[1;35m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
# Preserve colors; Strip blank lines; Disable prompts
export LESS='-R -X -P$'

#
# grep
#
# Silently ignore binaries; Enable colors
export GREP_OPTIONS='-I --color=auto'
# Render matching text in bold red
export GREP_COLORS='ms=01;31'

#
# ripgrep
#
# Fix configuration file loading
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
# Sort; Colorize
alias rg='rg --sort-files --pretty --colors "match:fg:red" --colors "path:fg:cyan" --colors "line:fg:white"'

# vi default editor
export EDITOR='vi'

# tar strip AppleDouble junk entries
export COPYFILE_DISABLE='true'

# gitignore
gi() {
    curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}

#
# Docker
#
# # Fix spurious buildx warnings
# export BUILDX_NO_DEFAULT_LOAD='true'
# Reduce noise
export DOCKER_SCOUT_SUGGEST='false'

#
# rsync
#
# Fix tab completion
export RSYNC_OLD_ARGS='1'
# Recurse over directories; Aggregate metrics
alias rsync='rsync -a --info progress2'

#
# cargo
#
# Fix nontty's
export CARGO_TERM_COLOR='never'
# Reduce noise
alias cargo='cargo -q'

# ollama reset REPL history
export OLLAMA_NOHISTORY='1'

# Load extras
[ -d ~/.zshrc.d ] && for f in $(find ~/.zshrc.d -name '*.zsh' -print); do . "$f"; done

# # End profiling
# zprof
