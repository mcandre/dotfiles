# ln -s .../.bashrc ~/.bashrc

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0 > /dev/null
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# OPAM configuration
. /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
