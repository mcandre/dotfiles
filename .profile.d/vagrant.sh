#!/bin/sh
grep -i 'microsoft' /proc/version &&
    export VAGRANT_WSL_ENABLE_WINDOWS_ACCESS="1"
