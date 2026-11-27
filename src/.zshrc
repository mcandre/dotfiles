#
# Performance Tweaks
#
# sudo mv /etc/zprofile /etc/zprofile.bak
# sudo mv /etc/zshrc /etc/zshrc.bak
#

# # Begin profiling
# zmodload zsh/zprof

[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"

. ~/.git-prompt.sh

# Fix Unicode
setopt COMBINING_CHARS

# Avoid conflicts with /usr/bin/log
disable log

# History performance tweaks
setopt BANG_HIST
setopt append_history
unsetopt extended_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_space
HISTFILE=~/.zsh_history
HISTSIZE=4096
SAVEHIST=2048

# Quiet
setopt nobeep

# Prompt
autoload -U colors
colors
MONOKAI='148' # 8 bit ANSI ; 24 bit #afd700
PS1="%B%F{${MONOKAI}}%#%f%b "
PROMPT_EOL_MARK=''
JAZZBERRY='125' # 8 bit ANSI ; 24 bit #af005f
setopt PROMPT_SUBST
GIT_PS1_SHOWDIRTYSTATE='1'
RPS1='%B%F{'"${JAZZBERRY}"'}%n@%m:%~$(__git_ps1 " (%s)")%f%b'

# Copypasta UX
setopt TRANSIENT_RPROMPT

zle_highlight=("default:fg=${MONOKAI},bold")

#
# Title
#

function _set_tab_title_preexec() {
    if [[ ! -o interactive || ! -t 2 ]]; then
        return
    fi

    print -Pn $'\e]1;'"${1%% *}"$'\a'
}

function _set_tab_title_precmd() {
    if [[ ! -o interactive || ! -t 2 ]]; then
        return
    fi

    print -Pn $'\e]1;\a'
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _set_tab_title_preexec
add-zsh-hook precmd _set_tab_title_precmd

# Block cd typos
cd () {
    builtin cd "${1:-"$(pwd)"}"
}

# Vim
export EDITOR='vi'

# gitignore
gi() {
    curl -sL "https://www.toptal.com/developers/gitignore/api/$*"
}

# DevOps productivity secrets
alias tree='tree -a'
alias ll='ls -Ahl'

#
# Monokai Pro
#

# GNU ls
export CLICOLOR='1'
export LS_COLORS='di=34:ln=1;36:so=31;40:pi=30;40:ex=1;32:bd=31;47:cd=33;47:su=30;41:sg=30;42:tw=30;43:ow=30;44:'
alias ls='ls --color=auto'

# grep
export GREP_OPTIONS='--color=auto'

# Pagers
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
# ripgrep
#

# Fix configuration file loading
export RIPGREP_CONFIG_PATH=~/.ripgreprc

# Sort; Colorize
alias rg='rg --sort-files --pretty --colors "match:fg:red" --colors "path:fg:cyan" --colors "line:fg:white"'

# Accelerate searches
alias grep='rg'

#
# cargo
#

# Fix nontty's
export CARGO_TERM_COLOR='never'

# Reduce noise
alias cargo='cargo -q'

#
# rsync
#

# Fix tab completion
export RSYNC_OLD_ARGS='1'

# Recurse over directories; Aggregate metrics
alias rsync='rsync -a --info progress2'

# Reset REPL history
export OLLAMA_NOHISTORY='1'

# Normalize ecomic authors ; Exclude junk
alias squeeze='squeeze -a -x '\''*.xml'\'' -x '\''*.csv'\'' -x '\''*.sfv'\'' -x '\''*.txt'\'' -x '\''final.webp'\'''

# Credentials
[ -r ~/.tokens.zsh ] && . ~/.tokens.zsh

# zsh-defer
. ~/zsh-defer/zsh-defer.plugin.zsh

# Tab Completion
. ~/.autocompletions.zsh

function provision-extras() {
    [ -d ~/.zshrc.d ] && for f in $(find ~/.zshrc.d -name '*.zsh' -print); do . "$f"; done
}

provision-extras

# # End profiling
# zprof
