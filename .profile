for f in $HOME/.profile.d/enabled/*.sh; do
    . "$f"
done
