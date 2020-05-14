[ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in $HOME/.zshrc.d/enabled/*; do
        . "$f"
    done

setopt nolistbeep
setopt noautomenu

autoload -U select-word-style
select-word-style bash

uname -a | grep Ubuntu >/dev/null &&
    bindkey "^[[1;5D" backward-word &&
    bindkey "^[[1;5C" forward-word
