# mkdir -p $HOME/.bashrc.d/
# ln -s .../opam $HOME/.bashrc.d/opam
# echo 'for f in "$HOME"/.bashrc.d/* ; do source "$f" ; done' >> $HOME/.bashrc

# OCaml show error traces
export OCAMLRUNPARAM="b"

# OPAM
source "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
