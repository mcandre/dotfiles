#!/bin/bash
unset IFS
set -eufo pipefail

# EditorConfig
cp .editorconfig ~

pushd "$(dirname "$0")"

#
# apt
#
sudo apt-get update
sudo apt-get install -y \
    avahi-daemon
curl \
    direnv \
    gawk \
    git \
    gnupg \
    jq \
    libnss-mdns \
    mkvtoolnix \
    progress \
    rename \
    ripgrep \
    rsync \
    screen \
    tree \
    watch \
    zsh

#
# mDNS
#
sudo cp avahi-daemon /etc/default/avahi-daemon
sudo systemctl unmask avahi-daemon.service avahi-daemon.socket
sudo systemctl enable avahi-daemon.service avahi-daemon.socket
sudo systemctl start avahi-daemon.service avahi-daemon.socket

#
# zsh
#
curl --proto '=https' --tlsv1.2 -sSLfo ~/.git-prompt.sh 'https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh'
cp .hushlogin ~
cp .zshenv ~
cp .zprofile ~
cp .zshrc ~
cp .autocompletions.zsh ~
zsh -lic '. .zshrc.d/zcache.zsh && zcache'
chsh -s "$(which zsh)"

# direnv
cp -r .config/direnv ~/.config

# Dev Tools
cp global.tool-versions ~/.tool-versions
asdf plugin add go
asdf plugin add rust
asdf install

# Vim
cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa

# XDG
mkdir -p ~/.local/bin

#
# git
#
cp .gitignore-global ~
git config --global core.excludesfile ~/.gitignore-global

# ji
git clone git@github.com:mcandre/ji ~/src/github.com/mcandre/ji
ln -sf ~/src/github.com/mcandre/ji/bin/ji ~/.local/bin/ji

# kickers
git clone git@github.com:mcandre/kickers ~/src/github.com/mcandre/kickers
ln -sf ~/src/github.com/mcandre/kickers/.kickers/kick ~/.local/bin/kick

# reencode
git clone git@github.com:mcandre/reencode ~/src/github.com/mcandre/reencode
ln -sf ~/src/github.com/mcandre/reencode/bin/reencode ~/.local/bin/reencode

# resolution
git clone git@github.com:mcandre/resolution ~/src/github.com/mcandre/resolution
ln -sf ~/src/github.com/mcandre/resolution/bin/resolution ~/.local/bin/resolution

# ripgrep
cp .ripgreprc ~

# screen
cp .screenrc ~
