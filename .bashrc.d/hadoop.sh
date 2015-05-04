# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../hadoop.sh $HOME/.bashrc.d/enabled/hadoop.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

export HADOOP_OPTS='-Djava.security.krb5.realm= -Djava.security.krb5.kdc= -Djava.security.krb5.conf=/dev/null'
