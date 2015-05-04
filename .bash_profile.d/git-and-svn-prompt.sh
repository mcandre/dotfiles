# mkdir -p $HOME/.bash_profile.d/enabled/
# ln -s .../git-and-svn-prompt $HOME/.bash_profile.d/enabled/git-and-svn-prompt.sh
# echo 'for f in "$HOME/.bash_profile.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bash_profile

# git prompt
# See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
. "$HOME/git-prompt.sh"

# svn prompt
# See https://raw.githubusercontent.com/mcandre/svn-prompt/master/svn-prompt.sh
. "$HOME/svn-prompt.sh"

export PS1='\W$(__git_ps1 " (%s)")$(parse_svn_branch)$ '
