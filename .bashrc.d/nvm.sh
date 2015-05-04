# mkdir -p $HOME/.bashrc.d/
# ln -s .../nvm $HOME/.bashrc.d/nvm
# echo 'for f in "$HOME"/.bashrc.d/* ; do source "$f" ; done' >> $HOME/.bashrc

# NPM
[ -e "$HOME/.nvm/nvm.sh" ] && source "$HOME/.nvm/nvm.sh"
nvm use v0.10 > /dev/null
