#!/bin/sh
if [ -r /proc/version ] && grep -i 'microsoft' /proc/version >/dev/null; then
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
fi
