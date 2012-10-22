#!/bin/sh
# Runs Clojure using the classpath specified in the `.clojure` file of the
# current directory.
#
# Andrew Pennebaker http://www.yellosoft.us/
# Rewrote for modern Clojure
# Rewrite for rlwrap
#
# Mark Reid <http://mark.reid.name>
# CREATED: 2009-03-29

CLJ_DIR=$HOME/Library/Clojure/lib
CLOJURE=$CLJ_DIR/clojure.jar
CONTRIB=$CLJ_DIR/clojure-contrib.jar
JLINE=$CLJ_DIR/jline.jar

CP=$PWD:$CLOJURE:$JLINE:$CONTRIB
BREAKCHARS="(){}[],^%$#@\"\";:''|\\"
RLWRAP="rlwrap -b $BREAKCHARS --remember -c -f $HOME/.clj_completions -H $HOME/.clj_history -s 1000000"

# Add extra jars as specified by `.clojure` file
if [ -f .clojure ]; then
	CP=$CP:`cat .clojure`
fi

CLJ="$RLWRAP java -cp $CP clojure.main"

if [ -z "$1" ]; then
	$CLJ --repl $@
else
	$CLJ "$@"
fi