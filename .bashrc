# ln -s .../.bashrc ~/.bashrc

# Fix prompt for emacs shell-mode
case "$TERM" in
  dumb)
    PROMPT_COMMAND=
esac

# gitignore
# See https://www.gitignore.io/
function gitignore {
  curl -L -s https://www.gitignore.io/api/$1
}

# Pass aliases to sudo commands
alias sudo='sudo '

# Life's too short
alias ll='ls -Ahl'

# Hide progress bar
alias curl='curl -s'

# Don't split spaces into multiple filenames
# Show progress bar
alias rsync='rsync -a --info=progress2'

# OCaml show error traces
export OCAMLRUNPARAM="b"

export ANDROID_HOME=/usr/local/opt/android-sdk

export CVSROOT=$HOME/cvs

# # OPAM
# . /Users/andrew/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done

# Cabal
PATH="$PATH:/Library/Haskell/bin"
PATH="$PATH:$HOME/Library/Haskell/bin"
PATH="$PATH:$HOME/.cabal/bin"

export PATH
