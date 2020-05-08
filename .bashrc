# Preserve Windows PATH, if any
case "$(uname -s)" in
MINGW*) ;;

MSYS*) ;;

*)
    export PATH='/usr/bin:/bin:/usr/sbin:/sbin'
    ;;
esac

for f in ~/.bashrc.d/enabled/*.sh; do
    . "$f"
done

eval "$(direnv hook bash)"
export DIRENV_LOG_FORMAT=
direnv reload
