# (Re)generate performant bytecode for zsh configurations
zcache() {
    zcompile ~/.zshenv
    zcompile ~/.zshrc

    [ -d ~/.zshenv.d ] && for f in $(find ~/.zshenv.d -name '*.zsh' -print); do zcompile "$f"; done
    [ -d ~/.zshrc.d ] && for f in $(find ~/.zshrc.d -name '*.zsh' -print); do zcompile "$f"; done
}

# Remove zsh bytecode
clean-zcache() {
    [ -d ~/.zshrc.d ] && find ~/.zshrc.d -name '*.zwc' -delete
    [ -d ~/.zshenv.d ] && find ~/.zshenv.d -name '*.zwc' -delete
    rm -f ~/.zshrc.zwc
    rm -f ~/.zshenv.zwc
}
