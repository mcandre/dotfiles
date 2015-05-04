# mkdir -p $HOME/.bash_profile.d/
# ln -s .../docker-completion $HOME/.bash_profile.d/docker-completion
# echo 'for f in "$HOME"/.bash_profile.d/* ; do . "$f" ; done' >> $HOME/.bash_profile

# docker tab completion
# See https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker
. "$HOME/.docker-completion.sh"
