PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$HOME/.cask/bin:$PATH"
export PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
