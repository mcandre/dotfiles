# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../rvm $HOME/.bashrc.d/enabled/rvm
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# RVM
[ -e "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"
