export LANG='C.UTF-8'

# macOS
[ -x /usr/libexec/path_helper ] && eval `/usr/libexec/path_helper -s`

# WSL
[ -r ~/.path.zsh ] && . ~/.path.zsh

typeset -Uga path

path=(
    # asdf
    ~/.asdf/shims

    # Docker
    ~/.docker/bin

    # Homebrew
    /opt/homebrew/opt/coreutils/libexec/gnubin
    /opt/homebrew/opt/make/libexec/gnubin
    /opt/homebrew/opt/unzip/bin
    /opt/homebrew/bin
    /opt/homebrew/sbin

    # System
    $path

    # snap
    /snap/bin

    # # Inkscape
    # /Applications/Inkscape.app/Contents/Resources/bin

    # # iTerm2
    # /Applications/iTerm.app/Contents/Resources/utilities

    # # LaTeX
    # /usr/texbin

    # # MacTex
    # /Library/TeX/texbin

    # # Cabal
    # ~/.cabal/bink

    # # Bela
    # ~/src/github.com/BelaPlatform/Bela/scripts

    # # gifenc
    # ~/src/github.com/thevangelist/FFMPEG-gif-script-for-bash

    # XDG
    ~/.local/bin
)
