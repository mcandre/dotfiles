[ -e "$HOME/.bashrc" ] && . "$HOME/.bashrc"

for f in $(find "$HOME/.bash_profile.d/enabled" -type f -o -type l); do
    if [[ -x "$f" ]]; then
        . "$f"
    fi
done

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
