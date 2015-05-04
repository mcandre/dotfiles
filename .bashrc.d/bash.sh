# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../bash.sh $HOME/.bashrc.d/enabled/bash.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# Correct quotes.
set +H

# Bash 4: Fix recursive globs
shopt -s globstar
