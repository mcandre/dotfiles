# Block cd typos
cd () {
    if [ "$#" -eq 0 ]; then
        echo 'NOP'
        return
    fi

    builtin cd "$@"
}
