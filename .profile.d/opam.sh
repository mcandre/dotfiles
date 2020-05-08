#!/bin/sh

# OCaml show error traces
export OCAMLRUNPARAM='b'

# OPAM
. "$HOME/.opam/opam-init/init.sh" 2>&1 >/dev/null || true
