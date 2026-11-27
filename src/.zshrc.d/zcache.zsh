#
# zcache
#
#
# Optimize <script>:
#
# zcompile <script>
#

# (Re)generate performant bytecode for zsh configurations
zcache() {
    [ -r ~/.zshenv ] && zcompile ~/.zshenv
    [ -r ~/.zprofile ] && zcompile ~/.zprofile
    [ -r ~/.zshrc ] && zcompile ~/.zshrc
    [ -r ~/.tokens.zsh ] && zcompile ~/.tokens.zsh
    [ -r ~/.autocompletions.zsh ] && zcompile ~/.autocompletions.zsh
    [ -d ~/.zshenv.d ] && for f in $(find ~/.zshenv.d -name '*.zsh' -print); do zcompile "$f"; done
    [ -d ~/.zshrc.d ] && for f in $(find ~/.zshrc.d -name '*.zsh' -print); do zcompile "$f"; done
    [ -r ~/.git-prompt.sh ] && zcompile ~/.git-prompt.sh
}

# Remove zsh bytecode
clean-zcache() {
    rm -f ~/.git-prompt.sh.zwc
    [ -d ~/.zshrc.d ] && find ~/.zshrc.d -name '*.zwc' -delete
    rm -f ~/.autocompletions.zwc
    rm -f ~/.tokens.zwc
    rm -f ~/.zshrc.zwc
    rm -f ~/.zprofile.zwc
    rm -f ~/.zshenv.zwc
}
