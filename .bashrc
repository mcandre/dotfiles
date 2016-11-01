PATH='/usr/bin:/bin:/usr/sbin:/sbin'

[ -e "$HOME/.bashrc.d" ] && for f in $(find "$HOME/.bashrc.d/enabled" -type f -o -type l); do
    if [[ -x "$f" ]]; then
        . "$f"
    fi
done

eval "$(direnv hook bash)"
export DIRENV_LOG_FORMAT=''
