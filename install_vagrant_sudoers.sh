#!/bin/bash
# Script for placing sudoers.d files with syntax-checking

if [ -z "$1" ]; then
  # Making a temporary file to contain the sudoers-changes to be pre-checked
  TMP=$(mktemp)
  cat > $TMP <<EOF
Cmnd_Alias VAGRANT_EXPORTS_ADD = /bin/su root -c echo '*' >> /etc/exports
Cmnd_Alias VAGRANT_NFSD = /etc/init.d/nfs-kernel-server restart
Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /bin/sed -e /*/ d -ibak /etc/exports
%admin ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD, VAGRANT_EXPORTS_REMOVE
EOF
    # Check if the changes we want are OK
    visudo -c -f $TMP
    if [ $? -eq 0 ]; then
        # This computes! Starting up visudo with this script as first parameter
        export EDITOR=$0 && export FILE_OK=$TMP && sudo -E visudo -f /etc/sudoers.d/vagrant_sudoers
    fi
else
    # Copying changes to the visudo-managed tmp-file
    cat $FILE_OK | tee -a $1
    rm -f $FILE_OK
fi
# Exiting, visudo will check syntax again (which we already know is OK)
