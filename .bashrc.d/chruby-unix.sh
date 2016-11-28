if [ -e /usr/local/share/chruby/chruby.sh ]; then
    . /usr/local/share/chruby/chruby.sh

    if [ -e "$HOME/.rvm/scripts/extras/chruby.sh" ]; then
        . "$HOME/.rvm/scripts/extras/chruby.sh"

        RUBIES+=($HOME/.rvm/rubies/*)
    fi

    . /usr/local/share/chruby/auto.sh

    export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
fi
