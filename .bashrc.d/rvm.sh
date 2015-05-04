# mkdir -p $HOME/.bashrc.d/
# ln -s .../rvm $HOME/.bashrc.d/rvm
# echo 'for f in "$HOME"/.bashrc.d/* ; do source "$f" ; done' >> $HOME/.bashrc

# RVM
[ -e "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.0 > /dev/null
export PATH="$PATH:$HOME/.rvm/bin"
