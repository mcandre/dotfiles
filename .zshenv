[ -r "$HOME/.profile" ] &&
    . "$HOME/.profile"

[ -r "$HOME/.zshenv.d/enabled" ] &&
    [ -z "$(find "$HOME/.zshenv.d/enabled" -prune -empty)" ] &&
    for f in $HOME/.zshenv.d/enabled/*.sh; do
        . "$f"
    done

command -v direnv 2>&1 >/dev/null &&
    eval "$(direnv hook zsh)" &&
    export DIRENV_LOG_FORMAT= &&
    direnv reload
