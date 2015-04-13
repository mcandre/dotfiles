# ln -s .../.bashrc ~/.bashrc

# Fix prompt for emacs shell-mode
case "$TERM" in
  dumb)
    PROMPT_COMMAND=
esac

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done

# Cabal
PATH="$PATH:/Library/Haskell/bin"
PATH="$PATH:$HOME/Library/Haskell/bin"
PATH="$PATH:$HOME/.cabal/bin"

export PATH
