PATH='/usr/bin:/bin:/usr/sbin:/sbin'
for f in $(find "$HOME/.bashrc.d/enabled" -type f -o -type l); do . "$f"; done
