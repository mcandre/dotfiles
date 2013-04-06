#!/bin/bash

EMACS_BIN=/Applications/Emacs.app/Contents/MacOS/Emacs

if [[ $@ =~ -nw ]]; then
  $EMACS_BIN ${1+"$@"};
else
  nohup $EMACS_BIN ${1+"$@"} > /dev/null &
fi
