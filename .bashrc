PATH='/usr/bin:/bin:/usr/sbin:/sbin'

[ -e "$HOME/.bashrc.d" ] && for f in $(find "$HOME/.bashrc.d/enabled" -type f -o -type l); do
    if [[ -x "$f" ]]; then
        . "$f"
    fi
done

type direnv > /dev/null
if [ "$?" -eq 0 ]; then
    eval "$(direnv hook bash)"
    export DIRENV_LOG_FORMAT=''
fi
