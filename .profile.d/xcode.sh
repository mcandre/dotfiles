#!/bin/sh
# Fix Xcode PATH
export PATH="${PATH}:$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/bin"
