#!/bin/sh

#
# domain appears to be blocking curl
#

gitignore() {
    IFS=','
    TERMS=$*
    unset IFS
    curl -L -s "https://www.toptal.com/developers/gitignore/api/$TERMS"
}
