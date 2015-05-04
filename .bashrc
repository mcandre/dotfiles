# ln -s .../.bashrc ~/.bashrc

# Reset path
PATH='/usr/bin:/bin:/usr/sbin:/sbin'

# Fix prompt for emacs shell-mode
[ "$TERM" = 'dumb' ] && export PROMPT_COMMAND=''

for f in "$HOME/.bashrc.d/enabled/"*; do . "$f"; done
