provision-autocompletions() {
    autoload -U compinit
    compinit

    # Fix autocomplete menu highlighting
    zstyle ':completion:*' menu yes=long select

    # Fix Shift+Tab reverse navigation
    bindkey '^[[Z' reverse-menu-complete

    # Allow cursor navigation during autocompletion
    bindkey -e


    # Aliases
    setopt completealiases

    # Case insensitive
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

    # Preserve initial file path syntax
    zstyle ':completion:*' completion_auto_quote true

    # Reduce tab completion collisions with rare commands
    zstyle ':completion:*:*:-command-:*:*' ignored-patterns 'Magick*-config|magick-script'

    # makefiles
    zstyle ':completion::complete:make:*:targets' call-command true

    #
    # Hosts
    # https://git.geekify.de/sqozz/prezto_config/src/branch/sqozz_config/modules/completion/init.zsh
    #
    zstyle ':completion:*:(scp|rsync):*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:(scp|rsync):*' group-order users files all-files hosts-domain hosts-host hosts-ipaddr
    zstyle ':completion:*:ssh:*' tag-order 'hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *'
    zstyle ':completion:*:ssh:*' group-order users hosts-domain hosts-host users hosts-ipaddr
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-domain' ignored-patterns '<->.<->.<->.<->' '^[-[:alnum:]]##(.[-[:alnum:]]##)##' '*@*'
    zstyle ':completion:*:(scp|ssh|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

    # ASDF
    fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

    # Command navigation
    autoload -U select-word-style
    select-word-style bash
}

# Accelerate zsh loading
zsh-defer provision-autocompletions
