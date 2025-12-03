#!/bin/zsh

# Update via ji
# https://github.com/mcandre/ji
DISABLE_AUTO_UPDATE='true'

# Fix brew PATH glitch
[ -r "$HOME/.zshenv" ] &&
    . "$HOME/.zshenv"

# Fix cwd in WSL from non-Metro entrypoints
if [ "$(pwd)" = '/mnt/c/Windows/System32' ]; then
    cd "$HOME"
fi

[ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in "$HOME/.zshrc.d/enabled"/*; do
        # shellcheck source=/dev/null
        . "$f"
    done

setopt completealiases
setopt noautomenu
setopt nolistbeep
setopt BANG_HIST

autoload -U select-word-style
select-word-style bash

PROMPT_EOL_MARK=''
ZLE_REMOVE_SUFFIX_CHARS=''

if [ -d "$HOME/.oh-my-zsh" ]; then
    #
    # Fix Terminal.app cwd
    # Fix Ubuntu keys
    #

    # ZSH="$HOME/.oh-my-zsh"
    #
    # plugins=(
    #     git
    #     zsh-completions
    # )

    #
    # Fix base autocompletion
    #
    autoload -Uz compinit && compinit
    zstyle ':completion:*' menu select
    setopt auto_menu

    # Case insensitive
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

    # Respect opening file path CLI argument syntax.
    zstyle ':completion:*' completion_auto_quote true

    # Reduce tab completion collisions with rare commands
    zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'Magick*-config|magick-script'

    # make tab completion
    zstyle ':completion::complete:make:*:targets' call-command true

    #
    # Fix host completion
    # https://git.geekify.de/sqozz/prezto_config/src/branch/sqozz_config/modules/completion/init.zsh
    #
    zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
    zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

    #
    # Unbork aliases
    #
    AA="$(alias -L)"
    # # shellcheck source=/dev/null
    # . "$ZSH/oh-my-zsh.sh"
    unalias -m '*'
    eval "$AA"
fi

#
# Starship, transient prompt, and zle
#
. "${HOME}/.zsh-transient-prompt/transient-prompt.zsh-theme"
eval "$(starship init zsh)"
TRANSIENT_PROMPT_PROMPT='$(starship prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
TRANSIENT_PROMPT_RPROMPT='$(starship prompt --right --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
TRANSIENT_PROMPT_TRANSIENT_PROMPT='$(starship module character)'
zle_highlight=(default:fg=#D8FF00)
