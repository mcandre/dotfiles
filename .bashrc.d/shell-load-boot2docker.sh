# mkdir -p $HOME/.bashrc.d/
# ln -s .../shell-load-boot2docker.sh $HOME/.bashrc.d/shell-load-boot2docker.sh
# echo 'for f in $HOME/.bashrc.d/* ; do [[ -s $f ]] && source "$f" ; done' >> $HOME/.bashrc

# boot2docker
[[ -s /usr/local/bin/boot2docker ]] && boot2docker init 2>/dev/null > /dev/null && boot2docker up 2>/dev/null > /dev/null && eval $(boot2docker shellinit 2>/dev/null)
