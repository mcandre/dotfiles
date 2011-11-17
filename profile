# Reset path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

# Add Git
export PATH=$PATH:/usr/local/git/bin

# Add personal executables.
export PATH=$PATH:~/bin

# Correct quotes.
set +H

# Add JARs
# Scala
export CLASSPATH=$CLASSPATH:/Users/andrew/junit.jar:/Users/andrew/getopt.jar:.

# Add WireShark
export PATH=$PATH:/Applications/Wireshark.app/Contents/Resources/bin

# Add Inkscape
export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Add LaTeX binaries
export PATH=$PATH:/usr/local/texlive/2009/bin/universal-darwin

# Add cabal binaries
export PATH=$PATH:/Library/Haskell/bin
export PATH=$PATH:~/Library/Haskell/ghc-7.0.3/lib/hlint-1.8.13/bin

# Add darcs
export PATH=$PATH:~/Library/Haskell/ghc-7.0.2/lib/darcs-2.5.2/bin

# Add agner packages
export ERL_LIBS=/usr/local/agner/packages

# Add Homebrew
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Add Fink
export PATH=$PATH:~/fink/bin

# Add Node.js
export PATH=$PATH:~/node/bin

# Add Lispbox
export PATH=$PATH:/Applications/lispbox-0.7/Emacs.app/Contents/MacOS
alias emacs="Emacs -nw"
export PATH=$PATH:/Applications/lispbox-0.7/ccl-1.6-darwinx86
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias ccl="rlwrap -b \$BREAK_CHARS --remember -c -f ~/.ccl_completions -H ~/.ccl_history -s 1000000 dx86cl"

# Add Ehrlich
alias ehrlich="erl -noshell -s erl_tidy dir -s init stop"

# Add Pharo-Coral
export PATH=$PATH:~/Coral

# Begin in a useful directory
cd ~/Desktop

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# MacPorts
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Factor
export FACTOR_ROOT=/Applications/factor
export PATH=$PATH:$FACTOR_ROOT

# Go
export PATH=$PATH:~/go/bin
export GOROOT=~/go

# OCaml show error traces
export OCAMLRUNPARAM=b

# Chromium projects
export PATH=$PATH:~/depot_tools

# SAC
export SACBASE=~/sac
export SAC2CBASE=~/sac/sac2c
export LD_LIBRARY_PATH=~/sac/sac2c/lib
export PATH=$PATH:$SAC2CBASE/bin

# J
export PATH=/Applications/j64-701/bin:$PATH

# Mathematica
export PATH=$PATH:/Applications/Mathematica.app/Contents/MacOS

#Coq
export PATH=$PATH:/Applications/CoqIdE_8.3pl2.app/Contents/Resources/bin
