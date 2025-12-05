#!/bin/zsh

# Begin profiling
# zmodload zsh/zprof

# Fix cwd in WSL from non-Metro entrypoints
if [ "$(pwd)" = '/mnt/c/Windows/System32' ]; then
    cd "$HOME"
fi

PROMPT="%# "

zinit_post_hook() {
    eval "$(starship init zsh)"

    TRANSIENT_PROMPT_PROMPT='$(starship prompt --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
    TRANSIENT_PROMPT_RPROMPT='$(starship prompt --right --terminal-width="$COLUMNS" --keymap="${KEYMAP:-}" --status="$STARSHIP_CMD_STATUS" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --cmd-duration="${STARSHIP_DURATION:-}" --jobs="$STARSHIP_JOBS_COUNT")'
    TRANSIENT_PROMPT_TRANSIENT_PROMPT='$(starship module character)'
    PROMPT_EOL_MARK=''

    zle reset-prompt
}

load_zinit() {
    . "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit

    zinit ice wait silent
    zinit light "olets/zsh-transient-prompt"

    zinit ice wait silent nocd atload='zinit_post_hook'
    zinit light "starship/starship"
}

provision_interactive_shell() {
    setopt completealiases
    setopt noautomenu
    setopt nolistbeep
    setopt BANG_HIST
    setopt append_history
    setopt extended_history
    setopt share_history
    setopt hist_ignore_dups
    setopt hist_ignore_space
    HISTFILE=~/.zsh_history
    HISTSIZE=10000
    SAVEHIST=10000
    ZLE_REMOVE_SUFFIX_CHARS=''

    #
    # Fix base autocompletion
    #

    bindkey '^[[Z' reverse-menu-complete
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
    unalias -m '*'
    eval "$AA"

    autoload -Uz compinit
    compinit
    zle_highlight=(default:fg=#D8FF00)

    autoload -U select-word-style
    select-word-style bash

    # Fix brew PATH glitch
    [ -r "$HOME/.zshenv" ] &&
        . "$HOME/.zshenv"

    [ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
        for f in "$HOME/.zshrc.d/enabled"/*; do
            # shellcheck source=/dev/null
            . "$f"
        done
}

#
# accelerate interactive shell launches
#
autoload -Uz ~/zsh-defer/zsh-defer
zsh-defer load_zinit
zsh-defer provision_interactive_shell

# End profiling
# zprof
