# mkdir -p $HOME/.bashrc.d/
# ln -s .../chruby $HOME/.bashrc.d/chruby
# echo 'for f in "$HOME"/.bashrc.d/* ; do source "$f" ; done' >> $HOME/.bashrc

if [ -e /usr/local/opt/chruby/share/chruby/chruby.sh ]; then
  source /usr/local/opt/chruby/share/chruby/chruby.sh

  if [ -e "$HOME/.rvm/scripts/extras/chruby.sh" ]; then
    source $HOME/.rvm/scripts/extras/chruby.sh

    RUBIES+=($HOME/.rvm/rubies/*)
  fi

  source /usr/local/opt/chruby/share/chruby/auto.sh
fi
