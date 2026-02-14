# Fix rename
LC_ALL=en_US.UTF-8
LC_CTYPE=en_US.UTF-8

typeset -Uga path

# Setup PATH = system path + ~/bin + $GOPATH/bin
. ~/.path.zsh
. ~/.go.zsh

# Load extras
for f in ~/.zshenv.d/*.zsh; do . "$f"; done

# # Load direnv
# eval "$(direnv hook zsh)"
