#!/bin/sh

ssh_mode() {
    BASH_CONFIG="$1" &&
        shift &&
        scp "$HOME/.bashrc.d/ssh/$BASH_CONFIG" "$@:\$HOME/$BASH_CONFIG" &&
        ssh "$@" -t "bash --rcfile \$HOME/$BASH_CONFIG"
}

ssh_emacs() {
    ssh-mode 'bash-emacs-mode.sh' "$@"
}

ssh_vi() {
    ssh-mode 'bash-vi-mode.sh' "$@"
}
