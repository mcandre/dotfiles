#!/bin/bash
. "$HOME/.direnv.d/rvm.sh"
BREW_PREFIX="$(brew --prefix)"
. "${BREW_PREFIX}/opt/chruby/share/chruby/chruby.sh"
. "$HOME/.rvm/scripts/extras/chruby.sh"
. "${BREW_PREFIX}/opt/chruby/share/chruby/auto.sh"
