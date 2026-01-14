# Accelerate Homebrew loading
# unset INFOPATH
# unset MANPATH
# eval "$(/opt/homebrew/bin/brew shellenv)"

path=(
    /opt/homebrew/bin
    /opt/homebrew/sbin
    $path
)
