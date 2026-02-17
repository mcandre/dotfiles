# cwd
precmd () {
    print -Pn "\e]0;%1d\a"
}
