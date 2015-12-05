# Pass aliases to sudo commands
alias sudo='sudo '

# Show details
alias ll='ls -Ahl'

# Workaround pyenv shims vs. brew doctor
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"

# Colorize soft links
alias ls='gls --color=auto'

# Hide progress bar
alias curl='curl -s'

# Show overall progress bar
# Maintain all attributes
# Escape whitespace
alias rsync='rsync --info=progress2 -a -s'

# Disable bashate warnings
alias bashate='bashate -i E003'

# IntelliJ CLI
alias ij='open -a "$HOME/Applications/IntelliJ IDEA 15.app"'
