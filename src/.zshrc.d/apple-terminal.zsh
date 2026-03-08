# Reduce session noise
export SHELL_SESSIONS_DISABLE=1

#
# Reduce cursor ghosting
#
focus_trigger() {
    local cols="$(tput cols)"
    local lines="$(tput lines)"
    local cols_prime=$(( cols - 1 ))
    local lines_prime=$(( lines - 1 ))

    # Force a synthetic window resize event to remove visual glitches
    printf "\e[8;${lines_prime};${cols_prime}t"

    # Correct dimensions
    printf "\e[8;${lines};${cols}t"
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd focus_trigger
