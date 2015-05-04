# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../erl-libs.sh $HOME/.bashrc.d/enabled/erl-libs.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

ERL_LIBS="$HOME/Desktop/src/proper"
ERL_LIBS="$ERL_LIBS:$HOME/Desktop/src/getopt"
export ERL_LIBS
