# ln -s profile.sh ~/.profile

# Reset path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# RVM
#export PATH="/Users/andrew/.rvm/bin:$PATH"

# Add Git
export PATH="$PATH:/usr/local/git/bin"

# Add personal executables.
export PATH="$PATH:/Users/andrew/bin"

# Correct quotes.
set +H

# objdump
export PATH="$PATH:/opt/local/x86_64-apple-darwin12.1.0/bin"

# Add JARs
export CLASSPATH="$CLASSPATH:/Users/andrew/junit.jar:/Users/andrew/getopt.jar:."

# Add Inkscape
export PATH="$PATH:/Applications/Inkscape.app/Contents/Resources/bin"

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Add LaTeX binaries
export PATH="$PATH:/usr/local/texlive/2012/bin/universal-darwin"

# Add cabal binaries
export PATH="$PATH:/Library/Haskell/bin"
export PATH="$PATH:/Users/andrew/Library/Haskell/bin"
export PATH="$PATH:/Users/andrew/Library/Haskell/ghc-7.0.3/lib/hlint-1.8.13/bin"

# Add darcs
export PATH="$PATH:~/Library/Haskell/ghc-7.0.2/lib/darcs-2.5.2/bin"

# Add Node.js
export PATH="$PATH:~/node/bin"

# MacPorts
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# Factor
export FACTOR_ROOT="/Applications/factor"
export PATH="${PATH}:${FACTOR_ROOT}"

# Go
export PATH="$PATH:~/go/bin"
export GOROOT="~/go"

# OCaml show error traces
export OCAMLRUNPARAM="b"

#Coq
export PATH="$PATH:/Applications/CoqIdE_8.3pl2.app/Contents/Resources/bin"

# SML
export CM_VERBOSE=false

# Gruesome
export CLASSPATH="$CLASSPATH:/Users/andrew/Desktop/src/gruesome/gruesome-0.0.1.jar"

# MPlayer
export PATH="$PATH:/Applications/MPlayer OSX Extended.app/Contents/Resources/Binaries/mpextended.mpBinaries/Contents/mpextended.mpBinaries/Contents/MacOS"

# Bitcoin
export PATH="$PATH:/Applications/Bitcoin.app/Contents/MacOS"

# Python
export PYTHONPATH="$PYTHONPATH:/usr/local/lib/python2.7/site-packages"

# Perl6
export PATH="$PATH:~/rakudo/install/bin"

export PS1="\w$ "

# Xcode
export PATH="$PATH:/Developer/usr/bin"

# rar, unrar
export PATH="$PATH:~/bin/rar"

# Setting PATH for JRuby 1.7.1
# The orginal version is saved in .profile.jrubysave
export PATH="$PATH:/Library/Frameworks/JRuby.framework/Versions/Current/bin"

# Ruboto
export RUBOTO_KEYSTORE="~/.android/production.keystore"
export RUBOTO_KEY_ALIAS="yellosoft"

# PhoneGap
export PATH="$PATH:~/Desktop/src/phonegap/lib/android/bin"

# CEAN
export PATH="$PATH:~/cean/bin"

# Monokai
export CLICOLOR="1"
export GREP_OPTIONS="–color=auto"

# Begin in a useful directory
cd ~/Desktop
