# Add personal executables.
export PATH=~/bin:$PATH

# Correct quotes.
set +H

# Add WireShark
export PATH=$PATH:/Applications/Wireshark.app/Contents/Resources/bin

# Add Inkscape
export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Begin in a useful directory
cd ~/Desktop

# Add cabal binaries
export PATH=$PATH:~/.cabal/bin

# Add agner packages
export ERL_LIBS=/usr/local/agner/packages

# Add fink
export PATH=$PATH:/sw/bin

# Add MacPorts
export PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Add Lispbox
export PATH=$PATH:/Applications/lispbox-0.7/ccl-1.6-darwinx86/
alias ccl=dx86cl64

# Add ABCL
export CLASSPATH=$CLASSPATH:/home/andrew/abcl.jar
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias abcl="rlwrap -b \$BREAK_CHARS --remember -c -f ~/.abcl_completions -H ~/.abcl_history -s 1000000 java -jar ~/abcl.jar"
