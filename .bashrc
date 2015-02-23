# ln -s .../.bashrc ~/.bashrc

# NPM
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
  source "$HOME/.nvm/nvm.sh"

  # Node.js
  nvm use v0.10 > /dev/null
  # # io.js
  # nvm use iojs > /dev/null
fi

# OCaml show error traces
export OCAMLRUNPARAM="b"

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

# # OPAM
# . /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# Ruby
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"

  rvm use 2.0.0 > /dev/null
fi
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
