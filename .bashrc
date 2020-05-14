# Note: non-interactive configuration can be done in $BASH_ENV file path.

[ -r "$HOME/.profile" ] &&
    . "$HOME/.profile"

[ -r "$HOME/.bashrc.d/enabled" ] &&
    [ -z "$(find "$HOME/.bashrc.d/enabled" -prune -empty)" ] &&
    for f in $HOME/.bashrc.d/enabled/*.sh; do
        . "$f"
    done

command -v direnv 2>&1 >/dev/null &&
    eval "$(direnv hook bash)" &&
    export DIRENV_LOG_FORMAT= &&
    direnv reload
