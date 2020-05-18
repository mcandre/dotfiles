# shellcheck shell=sh

#
# Configuration suitable for any POSIX sh derivative.
#
# Note: POSIX sh will generally ignore this file unless launched with:
#
# ENV="$HOME/.profile" sh -i[c] <command>
#
# That pattern follows pre-POSIX sh behavior and
# can be more reliable than various online documentation.
#

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
    for f in "$HOME/.profile.d/enabled/"*; do
        # shellcheck source=/dev/null
        . "$f"
    done
