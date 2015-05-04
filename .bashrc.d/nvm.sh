# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../nvm.sh $HOME/.bashrc.d/enabled/nvm.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# NVM
[ -e "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh" && nvm use v0.10 > /dev/null
