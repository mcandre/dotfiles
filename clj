#!/bin/sh
# Clojure wrapper script.
# With no arguments runs Clojure's REPL.

# Put the Clojure jar from the cellar and the current folder in the classpath.
CLOJURE=$CLASSPATH:/usr/local/Cellar/clojure/1.4.0/clojure-1.4.0.jar:${PWD}

if [ "$#" -eq 0 ]; then
    if [ -z $INSIDE_EMACS ] && [ $TERM != "dumb" ]; then
		rlwrap --remember -c -b "(){}[],^%$#@\"\";:''|\\\\" -f ~/.clj_completions java -cp "$CLOJURE" clojure.main --repl
	else
		java -cp "$CLOJURE" clojure.main --repl
	fi
else
    java -cp "$CLOJURE" clojure.main "$@"
fi
