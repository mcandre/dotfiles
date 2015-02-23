# ln -s .../.bashrc ~/.bashrc

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

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
export PATH="$PATH:$HOME/.rvm/bin"
