#!/bin/sh
grep -i 'microsoft' /proc/version >/dev/null &&
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
