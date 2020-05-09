for f in ~/.zshrc.d/enabled/*.sh; do
    . "$f"
done

setopt nolistbeep
setopt noautomenu

autoload -U select-word-style
select-word-style bash
