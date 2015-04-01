# ln -s .../.bashrc ~/.bashrc

# Fix prompt for emacs shell-mode
case "$TERM" in
  dumb)
    PROMPT_COMMAND=
esac

# git prompt
# See https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
. $HOME/git-prompt.sh

# svn prompt
# See https://raw.githubusercontent.com/mcandre/svn-prompt/master/svn-prompt.sh
. $HOME/svn-prompt.sh

export PS1='\W$(__git_ps1 " (%s)")$(parse_svn_branch)$ '

# gitignore
# See https://www.gitignore.io/
function gitignore {
  curl -L -s https://www.gitignore.io/api/$1
}

# Pass aliases to sudo commands
alias sudo='sudo '

# Life's too short
alias ll='ls -Ahl'

# Hide progress bar
alias curl='curl -s'

# Don't split spaces into multiple filenames
# Show progress bar
alias rsync='rsync -s --info=progress2'

# OCaml show error traces
export OCAMLRUNPARAM="b"

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

# # OPAM
# . /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done
