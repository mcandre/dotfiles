#!/bin/sh
resolution() {
    ffprobe -v quiet \
        -print_format json \
        -show_format \
        -show_streams "$1" |
            jq '.streams[0].height'
}
