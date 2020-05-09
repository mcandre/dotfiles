. ~/.profile

for f in ~/.zshenv.d/enabled/*.sh; do
    . "$f"
done

eval "$(direnv hook zsh)"
export DIRENV_LOG_FORMAT=
direnv reload
