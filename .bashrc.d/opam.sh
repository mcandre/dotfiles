#!/bin/sh

# OCaml show error traces
export OCAMLRUNPARAM='b'

# OPAM
. "$HOME/.opam/opam-init/init.sh" > /dev/null 2> /dev/null || true
