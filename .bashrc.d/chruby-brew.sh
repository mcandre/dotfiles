#!/bin/bash

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
    . /usr/local/opt/chruby/share/chruby/chruby.sh

    if [ -e "$HOME/.rvm/scripts/extras/chruby.sh" ]; then
        . "$HOME/.rvm/scripts/extras/chruby.sh"

        RUBIES+=($HOME/.rvm/rubies/*)
    fi

    . /usr/local/opt/chruby/share/chruby/auto.sh

    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
