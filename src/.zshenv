# Fix rename et al
export LANG='en_US.UTF-8'
export LC_ALL="$LANG"

# # Go setup
# export GOPATH="$HOME/go"
# export GOBIN="$GOPATH/bin"

#
# PATH
#
typeset -Uga path

path=(
    # asdf
    ~/.asdf/shims

    #
    # Homebrew
    #
    # /opt/homebrew/opt/gnu-tar/libexec/gnubin
    /opt/homebrew/opt/coreutils/libexec/gnubin
    /opt/homebrew/opt/make/libexec/gnubin
    /opt/homebrew/bin
    /opt/homebrew/sbin

    # System
    $path

    # # Go
    # "$(go env GOBIN)"

    # snap
    /snap/bin

    # XDG
    ~/.local/bin
)

# Load extras
[ -d ~/.zshenv.d ] && for f in $(find ~/.zshenv.d -name '*.zsh' -print); do . "$f"; done
