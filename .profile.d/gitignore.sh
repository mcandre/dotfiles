#!/bin/sh

#
# domain appears to be blocking curl
#

gitignore() {
    curl -L -s "https://www.toptal.com/developers/gitignore/api/$@"
}
