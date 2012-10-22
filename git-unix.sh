#!/bin/sh

# Convert a git repository's Windows line endings to Unix line endings
#
# From GitHub Help
# https://help.github.com/articles/dealing-with-line-endings

git config --global core.autolf true
git config --global core.autocrlf false

git rm --cached -r .
git reset --hard
git add .
git commit -m "Unix line endings"