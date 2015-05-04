# ln -s .../.bashrc ~/.bashrc

# Fix prompt for emacs shell-mode
[ "$TERM" = 'dumb' ] && export PROMPT_COMMAND=''

# Reset path
PATH='/usr/bin:/bin:/usr/sbin:/sbin'

# Cabal
PATH="$PATH:/Library/Haskell/bin"
PATH="$PATH:$HOME/Library/Haskell/bin"
PATH="$PATH:$HOME/.cabal/bin"

export PATH

for f in "$HOME/.bashrc.d/enabled/"*; do . "$f"; done
