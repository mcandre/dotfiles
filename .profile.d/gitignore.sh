#!/bin/sh

gitignore() {
    curl -L -s "https://www.gitignore.io/api/$1"
}
