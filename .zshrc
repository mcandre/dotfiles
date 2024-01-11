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

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]; then
    # shellcheck source=/dev/null
    . "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in "$HOME/.zshrc.d/enabled"/*; do
        # shellcheck source=/dev/null
        . "$f"
    done

setopt nolistbeep
setopt noautomenu
setopt completealiases

autoload -U select-word-style
select-word-style bash

export PROMPT_EOL_MARK=

if [ -d "$HOME/.oh-my-zsh" ]; then
    #
    # Fix Terminal.app cwd
    # Fix Ubuntu keys
    #

    ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME='powerlevel10k/powerlevel10k'

    plugins=(
        git
        zsh-completions
    )

    zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'Magick*-config|magick-script'

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

    autoload -Uz compinit && compinit -i

    #
    # Unbork aliases
    #

    AA="$(alias -L)"

    # shellcheck source=/dev/null
    . "$ZSH/oh-my-zsh.sh"

    unalias -m '*'

    eval "$AA"

    # https://github.com/romkatv/powerlevel10k
    # shellcheck source=/dev/null
    [ -r "$HOME/.p10k.zsh" ] &&
        . "$HOME/.p10k.zsh"
fi
