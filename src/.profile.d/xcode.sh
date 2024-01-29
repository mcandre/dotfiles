#!/bin/sh
# Fix Xcode PATH
PATH="${PATH}:$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/bin"
export PATH
