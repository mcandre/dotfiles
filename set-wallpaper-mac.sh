#!/usr/bin/env sh
defaults write com.apple.desktop Background "{default = {ImageFilePath = \"$1\"; };}"
killall Dock
