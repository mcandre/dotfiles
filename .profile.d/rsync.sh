#!/bin/sh
#
# Recursive, 1MB/sec throttle, aggregate progress
alias rsync='rsync -a --bwlimit 1000 --info progress2'
