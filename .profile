# ln -s ...path/path/path/.profile ~/.profile

# Reset path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Personal binaries
export PATH="$PATH:~/bin"

# oclint
export PATH="$PATH:/Users/andrew/oclint-0.8.dev.27d706b/bin"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home"

# RVM
#export PATH="/Users/andrew/.rvm/bin:$PATH"

# CLI homepage
export WWW_HOME=https://duckduckgo.com/

# Add Git
export PATH="$PATH:/usr/local/git/bin"

# RubyGem binaries
export PATH="$PATH:/usr/local/Cellar/ruby/1.9.3-p385/bin:/usr/local/Cellar/ruby/2.0.0-p195/bin"

# Add personal executables.
export PATH="$PATH:/Users/andrew/bin"

# For `brew edit`, etc.
export EDITOR="emacs -nw"

# ehrlich
export PATH="$PATH:~/Desktop/src/ehrlich"

# proper
export ERL_LIBS="/Users/andrew/Desktop/src/proper"

# erlang getopt
export ERL_LIBS="$ERL_LIBS:/Users/andrew/Desktop/src/getopt"

# Correct quotes.
set +H

# objdump
export PATH="$PATH:/opt/local/x86_64-apple-darwin12.1.0/bin"

# # JUnit
# export CLASSPATH="$CLASSPATH:/Users/andrew/junit.jar"
# # GetOpt
# export CLASSPATH="$CLASSPATH:/Users/andrew/getopt.jar"
# # Gruesome
# export CLASSPATH="$CLASSPATH:/Users/andrew/Desktop/src/gruesome/gruesome-0.0.1.jar"

# Add Inkscape
export PATH="$PATH:/Applications/Inkscape.app/Contents/Resources/bin"

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Add MacTex LaTeX binaries
export PATH="$PATH:/usr/texbin"

# Add cabal binaries
export PATH="$PATH:/Library/Haskell/bin"
export PATH="$PATH:/Users/andrew/Library/Haskell/bin"
export PATH="$PATH:/Users/andrew/Library/Haskell/ghc-7.0.3/lib/hlint-1.8.13/bin"
export PATH="$PATH:/Users/andrew/.cabal/bin"

# Add darcs
export PATH="$PATH:~/Library/Haskell/ghc-7.0.2/lib/darcs-2.5.2/bin"

# Node.js
[[ -s /Users/andrew/.nvm/nvm.sh ]] && . /Users/andrew/.nvm/nvm.sh # This loads NVM
nvm use 0.10 > /dev/null

# Ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
rvm use 2.0.0 > /dev/null

# MacPorts
export PATH="$PATH:/opt/local/bin:/opt/local/sbin"

# OCaml show error traces
export OCAMLRUNPARAM="b"

#Coq
export PATH="$PATH:/Applications/CoqIdE_8.3pl2.app/Contents/Resources/bin"

# SML
export CM_VERBOSE=false

# MPlayer
export PATH="$PATH:/Applications/MPlayer OSX Extended.app/Contents/Resources/Binaries/mpextended.mpBinaries/Contents/mpextended.mpBinaries/Contents/MacOS"

# Perl6
export PATH="$PATH:~/rakudo/install/bin"

export PS1="\w$ "

# Xcode
export PATH="$PATH:/Developer/usr/bin"

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
export GREP_OPTIONS="--color=auto"

# Mozart/Oz
export PATH="$PATH:/Applications/Mozart.app/Contents/Resources/bin"
