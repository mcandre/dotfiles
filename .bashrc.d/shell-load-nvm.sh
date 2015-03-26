# mkdir -p $HOME/.bashrc.d/
# ln -s .../shell-load-nvm.sh $HOME/.bashrc.d/shell-load-nvm.sh
# echo 'for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done' >> $HOME/.bashrc

# NPM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
nvm use v0.10 > /dev/null
