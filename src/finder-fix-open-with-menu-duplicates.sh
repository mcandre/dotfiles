#!/bin/sh
#
# From IT Pixie
# http://itpixie.com/2011/05/fix-duplicate-old-items-open-with-list/

tools='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support'

"${tools}/lsregister" \
    -kill \
    -r \
    -domain local \
    -domain system \
    -domain user

# When this command finishes,
# Manually relaunch Finder.
