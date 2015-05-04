# mkdir -p $HOME/.bash_profile.d/enabled/
# ln -s .../git-completion $HOME/.bash_profile.d/enabled/git-completion.sh
# echo 'for f in "$HOME/.bash_profile.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bash_profile

# git tab completion
# See https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
. "$HOME/.git-completion.sh"
