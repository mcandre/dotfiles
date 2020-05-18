#!/bin/sh

# OCaml show error traces
export OCAMLRUNPARAM='b'

# shellcheck source=/dev/null
. "$HOME/.opam/opam-init/init.sh" >/dev/null 2>&1 ||
    :
