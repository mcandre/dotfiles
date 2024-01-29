#!/bin/sh

BREW_PREFIX="$(brew --prefix)"

# shellcheck source=/dev/null
. "$HOME/.direnv.d/rvm.sh"

# shellcheck source=/dev/null
. "${BREW_PREFIX}/opt/chruby/share/chruby/chruby.sh"

# shellcheck source=/dev/null
. "$HOME/.rvm/scripts/extras/chruby.sh"

# shellcheck source=/dev/null
. "${BREW_PREFIX}/opt/chruby/share/chruby/auto.sh"
