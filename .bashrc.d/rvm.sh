# mkdir -p $HOME/.bashrc.d/
# ln -s .../rvm $HOME/.bashrc.d/rvm
# echo 'for f in "$HOME"/.bashrc.d/* ; do . "$f" ; done' >> $HOME/.bashrc

# RVM
[ -e "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"
