# Fix rename et al
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Go setup
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

#
# PATH
#
typeset -Uga path

path=(
    # asdf
    "${ASDF_DATA_DIR:-$HOME/.asdf}/shims"

    #
    # Homebrew
    #
    # /opt/homebrew/opt/gnu-tar/libexec/gnubin
    /opt/homebrew/opt/coreutils/libexec/gnubin
    /opt/homebrew/bin
    /opt/homebrew/sbin

    # System
    $path

    # # Xcode
    # "$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/bin"

    # Go
    "$GOBIN"

    # snap
    /snap/bin

    # XDG
    ~/.local/bin
)

# Load extras
[ -d ~/.zshenv.d ] && for f in $(find ~/.zshenv.d -name '*.zsh' -print); do . "$f"; done
