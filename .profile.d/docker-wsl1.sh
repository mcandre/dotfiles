#!/bin/sh
[ -r /proc/version ] &&
    grep 'Microsoft' /proc/version &&
    export DOCKER_HOST='localhost:2375'
