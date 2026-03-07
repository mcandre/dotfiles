# Block cd typos
cd () {
    builtin cd "${1:-"$(pwd)"}"
}
