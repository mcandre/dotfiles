# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../jdk7.sh $HOME/.bashrc.d/enabled/jdk7.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
