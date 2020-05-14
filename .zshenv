[ -r "$HOME/.profile" ] &&
    . "$HOME/.profile"

[ -z "$(find "$HOME/.zshenv.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in $HOME/.zshenv.d/enabled/*; do
        . "$f"
    done

command -v direnv 2>&1 >/dev/null &&
    eval "$(direnv hook zsh)" &&
    export DIRENV_LOG_FORMAT= &&
    direnv reload
