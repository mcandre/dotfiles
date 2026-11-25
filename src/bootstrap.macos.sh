#!/bin/bash
unset IFS
set -eufo pipefail

# EditorConfig
cp .editorconfig ~

pushd "$(dirname "$0")"

#
# Homebrew
#

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install \
    asdf \
    awscli \
    coreutils \
    direnv \
    exiftool \
    ffmpeg-full \
    gallery-dl \
    gawk \
    ghostscript \
    git \
    gnu-sed \
    gnu-tar \
    gnupg \
    hammerspoon \
    imagemagick \
    jpeg-xl \
    jq \
    libavif \
    llvm \
    make \
    mkvtoolnix \
    netpbm \
    pandoc \
    progress \
    quicksilver \
    rectangle \
    rename \
    ripgrep \
    rsync \
    screen \
    shellcheck \
    tidy-html5 \
    tofrodos \
    tree \
    unzip \
    vim \
    watch \
    webp \
    wget \
    xmlstarlet \
    yt-dlp \
    zlib \
    zstd

# # Corrupts profile configuration system
# brew install --cask google-chrome

find ../fonts -type f -iname '*.ttf' -print -exec cp "{}" ~/Library/Fonts \+

#
# zsh
#

sudo mv /etc/zprofile /etc/zprofile.bak
sudo mv /etc/zshrc /etc/zshrc.bak
cp .hushlogin ~
cp .zshenv ~
cp .zprofile ~
cp .zshrc ~
cp .autocompletions.zsh ~
# shellcheck source=/dev/null
. .zshrc.d/zcache.zsh && zcache

# direnv
cp -r .config/direnv ~/.config
cp global.envrc ~/.envrc
zsh -lic 'cd ~ && direnv allow'

# Dev Tools
cp global.tool-versions ~/.tool-versions
asdf plugin add go
asdf plugin add rust
asdf install

# Vim
cp .vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
vim '+PlugInstall --sync' '+qa'

# wget
cp .wgetrc ~

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

# nile
git clone git@github.com:mcandre/nile ~/src/github.com/mcandre/nile
ln -sf ~/src/github.com/mcandre/nile/bin/nile ~/.local/bin/nile
ln -sf ~/src/github.com/mcandre/nile/bin/tidy_up ~/.local/bin/tidy_up

# reencode
git clone git@github.com:mcandre/reencode ~/src/github.com/mcandre/reencode
ln -sf ~/src/github.com/mcandre/reencode/bin/reencode ~/.local/bin/reencode

# resolution
git clone git@github.com:mcandre/resolution ~/src/github.com/mcandre/resolution
ln -sf ~/src/github.com/mcandre/resolution/bin/resolution ~/.local/bin/resolution

# squeeze
git clone git@github.com:mcandre/squeeze ~/src/github.com/mcandre/squeeze
ln -sf ~/src/github.com/mcandre/squeeze/bin/squeeze ~/.local/bin/squeeze

# ripgrep
cp .ripgreprc ~

# screen
cp .screenrc ~
