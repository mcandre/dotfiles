#!/bin/bash

BREW_PREFIX="$(brew --prefix)"

if [ -e "${BREW_PREFIX}/opt/chruby/share/chruby/chruby.sh" ]; then
    . "${BREW_PREFIX}/opt/chruby/share/chruby/chruby.sh"

    if [ -e "$HOME/.rvm/scripts/extras/chruby.sh" ]; then
        . "$HOME/.rvm/scripts/extras/chruby.sh"

        RUBIES+=($HOME/.rvm/rubies/*)
    fi

    . "${BREW_PREFIX}/opt/chruby/share/chruby/auto.sh"

    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
