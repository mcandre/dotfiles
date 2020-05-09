#!/bin/sh
unset IFS
set -eu

curl -o "$HOME/git-prompt.sh" https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
