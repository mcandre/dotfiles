# Fix rename et al
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

# Go
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

#
# Provision PATH
#
typeset -Uga path
. ~/.path.zsh

# Load extras
for f in $(find ~/.zshenv.d -name '*.zsh' -print); do . "$f"; done
