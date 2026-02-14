#!/bin/bash
unset IFS
set -eu

BASE_PTH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib'
printf "export PATH='$BASE_PTH" >~/.path.zsh

IFS=';' read -ra PTH_NTFS <<< "$(wslvar PATH)"

for PTH_NTFS in "${PTH_NTFS[@]}"; do
    PTH_UNIX="$(wslpath -u "$PTH_NTFS")"
    printf ":${PTH_UNIX}" >>~/.path.zsh
done

printf "'" >>~/.path.zsh
