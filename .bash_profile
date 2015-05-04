# ln -s .../.bash_profile ~/.bash_profile

[ -e "$HOME/.bashrc" ] && . "$HOME/.bashrc"

for f in "$HOME/.bash_profile.d/enabled/"*; do . "$f"; done
