# Accelerate Homebrew loading
# unset INFOPATH
# unset MANPATH
# eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /opt/homebrew/opt/gnu-tar/libexec/gnubin
    /opt/homebrew/opt/coreutils/libexec/gnubin
    /opt/homebrew/opt/gawk/libexec/gnubin
    $path
)
