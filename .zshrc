[ -r "$HOME/.zshrc.d/enabled" ] &&
    [ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty)" ] &&
    for f in $HOME/.zshrc.d/enabled/*.sh; do
     . "$f"
    done

setopt nolistbeep
setopt noautomenu

autoload -U select-word-style
select-word-style bash
