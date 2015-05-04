# mkdir -p $HOME/.bashrc.d/enabled/
# ln -s .../opam.sh $HOME/.bashrc.d/enabled/opam.sh
# echo 'for f in "$HOME/.bashrc.d/enabled/"* ; do . "$f" ; done' >> $HOME/.bashrc

# OCaml show error traces
export OCAMLRUNPARAM="b"

# OPAM
. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
