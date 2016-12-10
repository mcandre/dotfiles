#!/bin/sh

[ -e /usr/local/bin/boot2docker ] && [ -z "$DOCKER_HOST" ] && \
    eval "$(/usr/local/bin/boot2docker shellinit 2>/dev/null)"
