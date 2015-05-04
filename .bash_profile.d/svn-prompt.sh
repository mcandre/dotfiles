# mkdir -p $HOME/.bash_profile.d/enabled/
# ln -s .../git-prompt $HOME/.bash_profile.d/enabled/git-prompt.sh
# echo 'for f in "$HOME/.bash_profile.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bash_profile

# svn prompt
# See https://raw.githubusercontent.com/mcandre/svn-prompt/master/svn-prompt.sh
. "$HOME/svn-prompt.sh"

export PS1='\W$(parse_svn_branch)$ '
