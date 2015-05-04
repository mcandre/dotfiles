# ln -s .../.bash_profile ~/.bash_profile

[[ -s "$HOME/.bashrc" ]] && source "$HOME/.bashrc"

for f in "$HOME"/.bash_profile.d/* ; do source "$f"; done

# Home binaries
PATH="$PATH:$HOME"
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/Desktop/src/politerips/lib"
PATH="$PATH:$HOME/Desktop/src/wget-nsfw/lib"

# llvm-as
PATH="$PATH:/usr/local/Cellar/llvm/3.4/bin"

# oclint
PATH="$PATH:$HOME/oclint-0.8.dev.27d706b/bin"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

# Hadoop
export HADOOP_OPTS='-Djava.security.krb5.realm= -Djava.security.krb5.kdc= -Djava.security.krb5.conf=/dev/null'

# ehrlich
PATH="$PATH:$HOME/Desktop/src/ehrlich"

ERL_LIBS="$HOME/Desktop/src/proper"
ERL_LIBS="$ERL_LIBS:$HOME/Desktop/src/getopt"
export ERL_LIBS

# objdump
PATH="$PATH:/opt/local/x86_64-apple-darwin12.1.0/bin"

# Inkscape
PATH="$PATH:/Applications/Inkscape.app/Contents/Resources/bin"

# MacTex LaTeX
PATH="$PATH:/usr/texbin"

# Coq
PATH="$PATH:/Applications/CoqIdE_8.3pl2.app/Contents/Resources/bin"

# SML
export CM_VERBOSE=false

# Xcode
PATH="$PATH:/Developer/usr/bin"

# JRuby
PATH="$PATH:/Library/Frameworks/JRuby.framework/Versions/Current/bin"

# CEAN
PATH="$PATH:$HOME/cean/bin"

# Mozart/Oz
PATH="$PATH:/Applications/Mozart.app/Contents/Resources/bin"

export PATH

# Correct quotes.
set +H

# Prevent ._ files from being created in archives
export COPYFILE_DISABLE='true'

# Monokai
export CLICOLOR='1'
export GREP_OPTIONS='--color=auto'

# Emacs
export EDITOR='emacs -nw'

# Bash 4: Fix recursive globs
shopt -s globstar
