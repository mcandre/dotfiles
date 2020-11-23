#!/bin/sh
if [ -r /proc/version ] && grep 'Microsoft' /proc/version >/dev/null; then
    export DOCKER_HOST='localhost:2375'
fi
