#!/bin/bash

[[ -s "$HOME/.jenv/bin/jenv-init.sh" ]] && \
    source "$HOME/.jenv/bin/jenv-init.sh" && \
    source "$HOME/.jenv/commands/completion.sh"

# Silence successful jenv messages
function __jenvtool_utils_echo_green {
    echo $'\e[32m'"$1"$'\e[00m' >/dev/null
}

cd () {
    builtin cd "$@"
    if [[ -f "${PWD}/jenvrc" ]]; then
        echo "==============jenv load ======================" >/dev/null
        while read entry; do
            if ! __jenvtool_utils_string_contains "$entry", "#" ; then
                candidate1="$(echo ${entry} | sed 's/=.*//g')"
                version1="$(echo ${entry} | sed 's/.*=//g')"

                v="${JENV_DIR}/candidates/${candidate1}/${version1}"

                if [ -d "$v" ]; then
                    __jenvtool_use "${candidate1}" "${version1}"
                else
                    __jenvtool_install "${candidate1}" "${version1}"
                fi

                unset candidate1
                unset version1
            fi
        done < "${PWD}/jenvrc"
    fi
}
