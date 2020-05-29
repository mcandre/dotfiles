#!/bin/zsh

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

    plugins=(git)

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
