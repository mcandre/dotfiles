usage_resolution() {
    printf "Usage: %s <video>\n" "$0"
}

resolution() {
    if [ "$#" != 1 ]; then
        usage_resolution
        return 1
    fi

    ffprobe \
        -v error \
        -select_streams v:0 \
        -show_entries 'stream=width,height' \
        -of csv=s=x:p=0 \
        "$1"
}
