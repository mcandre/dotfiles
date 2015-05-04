# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../boot2docker.sh $HOME/.bashrc.d/enabled/boot2docker.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# boot2docker
[ -e /usr/local/bin/boot2docker ] && [ -z "$DOCKER_HOST" ] && eval $(/usr/local/bin/boot2docker shellinit 2>/dev/null)
