#!/bin/bash

# shellcheck source=/dev/null
[[ -s "$HOME/.jenv/bin/jenv-init.sh" ]] &&
    . "$HOME/.jenv/bin/jenv-init.sh" &&
    . "$HOME/.jenv/commands/completion.sh"

# Silence successful jenv messages
__jenvtool_utils_echo_green() {
    echo $'\e[32m'"$1"$'\e[00m' >/dev/null
}

cd() {
    builtin cd "$@" ||
        return 1

    if [[ -f "${PWD}/jenvrc" ]]; then
        echo "==============jenv load ======================" >/dev/null
        while read -r entry; do
            if ! __jenvtool_utils_string_contains "$entry", "#"; then
                candidate1="${entry//=*/}"
                version1="${entry//*=/}"

                v="${JENV_DIR}/candidates/${candidate1}/${version1}"

                if [ -d "$v" ]; then
                    __jenvtool_use "${candidate1}" "${version1}"
                else
                    __jenvtool_install "${candidate1}" "${version1}"
                fi

                unset candidate1
                unset version1
            fi
        done <"${PWD}/jenvrc"
    fi
}
