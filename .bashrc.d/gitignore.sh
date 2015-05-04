# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../gitignore $HOME/.bashrc.d/enabled/gitignore.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# gitignore
# See https://www.gitignore.io/
function gitignore {
  curl -L -s "https://www.gitignore.io/api/$1"
}
