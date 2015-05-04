# mkdir -p $HOME/.bash_profile.d/
# ln -s .../git-prompt $HOME/.bash_profile.d/git-prompt
# echo 'for f in "$HOME"/.bash_profile.d/* ; do . "$f" ; done' >> $HOME/.bash_profile

# svn prompt
# See https://raw.githubusercontent.com/mcandre/svn-prompt/master/svn-prompt.sh
. "$HOME/svn-prompt.sh"

export PS1='\W$(parse_svn_branch)$ '
