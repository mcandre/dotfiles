[ -e "$HOME/.bashrc" ] && . "$HOME/.bashrc"
for f in $(find "$HOME/.bash_profile.d/enabled" -type f -o -type l); do . "$f"; done
