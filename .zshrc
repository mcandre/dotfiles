[ -z "$(find "$HOME/.zshrc.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in $HOME/.zshrc.d/enabled/*; do
        . "$f"
    done

setopt nolistbeep
setopt noautomenu

autoload -U select-word-style
select-word-style bash


if [ -d "$HOME/.oh-my-zsh" ]; then
    #
    # Fix Terminal.app cwd
    # Fix Ubuntu keys
    #

    export ZSH="$HOME/.oh-my-zsh"

    plugins=(git)

    . "$ZSH/oh-my-zsh.sh"
fi
