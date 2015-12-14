PATH="/usr/local/bin:/usr/local/sbin:$PATH"
PATH="$HOME/.cask/bin:$PATH"
export PATH

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# Workaround pyenv shims vs. brew doctor
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
