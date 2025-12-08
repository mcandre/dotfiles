#!/bin/sh

usage_resolution() {
    printf "Usage: %s <video>\n" "$0"
}

resolution() {
    if [ "$#" -ne 1 ]; then
        usage_resolution
        return 1
    fi

    ffprobe \
        -v error \
        -select_streams v:0 \
        -show_entries stream=width \
        -of default=nw=1:nk=1 \
        "$1"
}
