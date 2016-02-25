PATH='/usr/bin:/bin:/usr/sbin:/sbin'

for f in $(find "$HOME/.bashrc.d/enabled" -type f -o -type l); do
  if [[ -x "$f" ]]; then
    . "$f"
  fi
done

eval "$(direnv hook bash)"

# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
