# mkdir -p $HOME/.bashrc.d/
# ln -s .../chruby $HOME/.bashrc.d/chruby
# echo 'for f in "$HOME"/.bashrc.d/* ; do . "$f" ; done' >> $HOME/.bashrc

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  . /usr/local/opt/chruby/share/chruby/chruby.sh

  if [ -e "$HOME/.rvm/scripts/extras/chruby.sh" ]; then
    . "$HOME/.rvm/scripts/extras/chruby.sh"

    RUBIES+=($HOME/.rvm/rubies/*)
  fi

  . /usr/local/opt/chruby/share/chruby/auto.sh
fi
