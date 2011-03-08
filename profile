# Reset path
export PATH=/usr/bin:/bin:/usr/sbin:/sbin

# Add Git
export PATH=$PATH:/usr/local/git/bin

# Add personal executables.
export PATH=$PATH:~/bin

# Correct quotes.
set +H

# Add WireShark
export PATH=$PATH:/Applications/Wireshark.app/Contents/Resources/bin

# Add Inkscape
export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Add cabal binaries
export PATH=$PATH:~/.cabal/bin

# Add agner packages
export ERL_LIBS=/usr/local/agner/packages

# Add Homebrew
export PATH=$PATH:/usr/local/bin:/usr/local/sbin

# Add MacPorts
export PATH=$PATH:~/macports/bin:~/macports/sbin

# Add Fink
export PATH=$PATH:~/fink/bin

# Add Lispbox
export PATH=$PATH:/Applications/lispbox-0.7/Emacs.app/Contents/MacOS
alias emacs="Emacs -nw"
export PATH=$PATH:/Applications/lispbox-0.7/ccl-1.6-darwinx86
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias ccl="rlwrap -b \$BREAK_CHARS --remember -c -f ~/.ccl_completions -H ~/.ccl_history -s 1000000 dx86cl"

# Begin in a useful directory
cd ~/Desktop
