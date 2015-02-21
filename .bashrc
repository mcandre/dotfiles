# ln -s .../.bashrc ~/.bashrc

# Node.js
[[ -s /Users/andrew/.nvm/nvm.sh ]] && . /Users/andrew/.nvm/nvm.sh # This loads NVM
nvm use 0.12 > /dev/null

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0 > /dev/null
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# OCaml show error traces
export OCAMLRUNPARAM="b"

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

# # OPAM
# . /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
