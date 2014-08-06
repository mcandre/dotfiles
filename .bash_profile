# ln -s ...path/path/path/.bash_profile ~/.bash_profile

# Pass aliases to sudo commands
alias sudo='sudo '

# Correct quotes.
set +H

# Prevent ._ files from being created in archives
export COPYFILE_DISABLE=true

# Monokai
export CLICOLOR="1"
export GREP_OPTIONS="--color=auto"

#
# Bash 4
#

# Fix recursive globs
shopt -s globstar

# git prompt
# https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
source ~/git-prompt.sh
export PS1='\W$(__git_ps1 " (%s)")$ '

# Reset path
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"

# Homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Cask
export PATH="$PATH:~/.cask/bin"
# Home binaries
export PATH="$PATH:~"
export PATH="$PATH:~/bin"
export PATH="$PATH:~/Desktop/src/mcandre/bash/lib"
export PATH="$PATH:~/Desktop/src/mcandre/sh/lib"
export PATH="$PATH:~/Desktop/src/wget-nsfw/lib"

# llvm-as
export PATH="$PATH:/usr/local/Cellar/llvm/3.4/bin"

# oclint
export PATH="$PATH:$HOME/oclint-0.8.dev.27d706b/bin"

# Java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_40.jdk/Contents/Home"

# Hadoop
export HADOOP_OPTS="-Djava.security.krb5.realm= -Djava.security.krb5.kdc= -Djava.security.krb5.conf=/dev/null"

# CLI homepage
export WWW_HOME="https://duckduckgo.com/"

# Add Git
export PATH="$PATH:/usr/local/git/bin"

# For `brew edit`, etc.
export EDITOR="emacs -nw"

# ehrlich
export PATH="$PATH:$HOME/Desktop/src/ehrlich"

# proper
export ERL_LIBS="$HOME/Desktop/src/proper"

# erlang getopt
export ERL_LIBS="$ERL_LIBS:$HOME/Desktop/src/getopt"

# objdump
export PATH="$PATH:/opt/local/x86_64-apple-darwin12.1.0/bin"

# Inkscape
export PATH="$PATH:/Applications/Inkscape.app/Contents/Resources/bin"

# MacTex LaTeX
export PATH="$PATH:/usr/texbin"

# Cabal
export PATH="$PATH:/Library/Haskell/bin"
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:$HOME/.cabal/bin"

# Darcs
export PATH="$PATH:$HOME/Library/Haskell/ghc-7.0.2/lib/darcs-2.5.2/bin"

#Coq
export PATH="$PATH:/Applications/CoqIdE_8.3pl2.app/Contents/Resources/bin"

# SML
export CM_VERBOSE=false

# MPlayer
export PATH="$PATH:/Applications/MPlayer OSX Extended.app/Contents/Resources/Binaries/mpextended.mpBinaries/Contents/mpextended.mpBinaries/Contents/MacOS"

# Xcode
export PATH="$PATH:/Developer/usr/bin"

# JRuby
export PATH="$PATH:/Library/Frameworks/JRuby.framework/Versions/Current/bin"

# Ruboto
export RUBOTO_KEYSTORE="$HOME/.android/production.keystore"
export RUBOTO_KEY_ALIAS="yellosoft"

# PhoneGap
export PATH="$PATH:$HOME/Desktop/src/phonegap/lib/android/bin"

# CEAN
export PATH="$PATH:$HOME/cean/bin"

# Mozart/Oz
export PATH="$PATH:/Applications/Mozart.app/Contents/Resources/bin"

source $HOME/.bashrc
