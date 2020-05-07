[ -r "$HOME/.profile" ] && . "$HOME/.profile"
[ -r "$HOME/.bashrc" ] && . "$HOME/.bashrc"

if [ -e "$HOME/.bash_profile.d" ]; then
    SCRIPTS=$(find "$HOME/.bash_profile.d/enabled" -name "*.sh" -print)
    for f in $SCRIPTS; do
        if [ -r "$f" ]; then
            . "$f"
        fi
    done
fi
