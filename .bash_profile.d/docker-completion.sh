# mkdir -p $HOME/.bash_profile.d/enabled/
# ln -s .../docker-completion $HOME/.bash_profile.d/enabled/docker-completion.sh
# echo 'for f in "$HOME/.bash_profile.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bash_profile

# docker tab completion
# See https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker
. "$HOME/.docker-completion.sh"
