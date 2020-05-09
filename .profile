# Note: non-interactive configuration can be done in $ENV file path.

# Preserve Windows PATH, if any
case "$(uname -s)" in
MINGW*) ;;

MSYS*) ;;

*)
    export PATH='/usr/bin:/bin:/usr/sbin:/sbin'
    ;;
esac

for f in $HOME/.profile.d/enabled/*.sh; do
    . "$f"
done
