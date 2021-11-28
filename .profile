#!/bin/sh
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

# Preserve WSL PATH, if any
if [ ! -r /proc/version ] || ! grep -i 'microsoft' /proc/version >/dev/null; then
    # Skip for most Cygwin-like environments
    case "$(uname -s)" in
    MINGW*) ;;

    MSYS*) ;;

    *)
        # Reset PATH to a clean state
        export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'
        ;;
    esac
fi

#
# Load extras
#
[ -z "$(find "$HOME/.profile.d/enabled" -prune -empty 2>/dev/null || echo 'missing')" ] &&
    for f in "$HOME/.profile.d/enabled/"*; do
        # shellcheck source=/dev/null
        . "$f"
    done
