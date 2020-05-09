# Note: non-interactive configuration can be done in $BASH_ENV file path.

. ~/.profile

for f in ~/.bashrc.d/enabled/*.sh; do
    . "$f"
done

eval "$(direnv hook bash)"
export DIRENV_LOG_FORMAT=
direnv reload
