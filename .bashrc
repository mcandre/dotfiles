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

# Pass aliases to sudo commands
alias sudo='sudo '

# Life's too short
alias ll='ls -Ahl'

# Hide progress bar
alias curl='curl -s'

# OCaml show error traces
export OCAMLRUNPARAM="b"

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

# # OPAM
# . /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# NPM
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
nvm use v0.10 > /dev/null

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
rvm use 2.0 > /dev/null
export PATH="$PATH:$HOME/.rvm/bin"

# boot2docker
[[ -s /usr/local/bin/boot2docker ]] && boot2docker up 2>/dev/null > /dev/null && boot2docker init 2>/dev/null > /dev/null && eval $(boot2docker shellinit 2>/dev/null)
