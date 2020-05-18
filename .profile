# Note: non-interactive configuration can be done in $ENV file path.

#
# Preserve Windows PATH, if any
#

[ -r /proc/version ] &&
    grep 'Microsoft' /proc/version &&
    return

case "$(uname -s)" in
MINGW*) ;;

MSYS*) ;;

*)
    export PATH='/usr/bin:/bin:/usr/sbin:/sbin'
    ;;
esac

[ -z "$(find "$HOME/.profile.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in $HOME/.profile.d/enabled/*; do
        . "$f"
    done
