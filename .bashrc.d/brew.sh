# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../brew.sh $HOME/.bashrc.d/enabled/brew.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$HOME/.cask/bin:$PATH"
export PATH
