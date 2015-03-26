# mkdir -p $HOME/.bashrc.d/
# ln -s .../shell-load-rvm.sh $HOME/.bashrc.d/shell-load-rvm.sh
# echo 'for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done' >> $HOME/.bashrc

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm use 2.0 > /dev/null
export PATH="$PATH:$HOME/.rvm/bin"
