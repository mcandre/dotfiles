# Add personal executables.
export PATH=~/bin:$PATH

# Correct quotes.
set +H

# Add MacPorts executables.
export PATH=$PATH:/opt/local/bin:/opt/local/sbin

# Add WireShark.
export PATH=$PATH:/Applications/Wireshark.app/Contents/Resources/bin

# Add Inkscape.
export PATH=$PATH:/Applications/Inkscape.app/Contents/Resources/bin

# Prevent ._ files from being created in archives
# Per http://www.litfuel.net/plush/?postid=147
export COPYFILE_DISABLE=true

# Begin in a useful directory.
cd ~/Desktop

# Add cabal binaries
export PATH=~/.cabal/bin:$PATH
