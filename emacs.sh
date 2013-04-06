#!/bin/bash
#
# ln -s /path/to/emacs.sh /usr/bin/emacs

EMACS_BIN=/Applications/Emacs.app/Contents/MacOS/Emacs

if [[ $@ =~ -nw ]]; then
  $EMACS_BIN ${1+"$@"};
else
  nohup $EMACS_BIN ${1+"$@"} > /dev/null &
  osascript -e 'tell application "System Events" to set frontmost of process "Emacs" to true'
fi
