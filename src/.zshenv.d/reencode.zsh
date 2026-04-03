usage_reencode() {
    printf "Usage: %s <video>\n" "$0"
}

reencode() {
    if [ "$#" != 1 ]; then
        usage_reencode
        return 1
    fi

    src="$1"
    base="${src%.*}"
    dest="$base.mp4"

    ffmpeg \
        -i "$src" \
        -c:v libx264 \
        -c:a aac \
        "$dest"
}
