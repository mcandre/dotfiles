# mkdir -p $HOME/.bashrc.d/
# ln -s .../boot2docker $HOME/.bashrc.d/boot2docker
# echo 'for f in "$HOME"/.bashrc.d/* ; do . "$f" ; done' >> $HOME/.bashrc

# boot2docker
[ -e /usr/local/bin/boot2docker ] && [ -z "$DOCKER_HOST" ] && eval $(boot2docker shellinit 2>/dev/null)
