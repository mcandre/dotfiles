# Vim Cheatsheet

Andrew Pennebaker

https://github.com/mcandre/dotfiles/blob/master/vim-cheatsheet.md

## Documentation

[Vim Tips Wiki](http://vim.wikia.com/wiki/Vim_Tips_Wiki)

[vi and Vim Editors Pocket Reference](http://shop.oreilly.com/product/0636920010913.do)

[Vim Genius](http://vimgenius.com/)

[VIM Adventures](http://vim-adventures.com/)

[The Vi Lovers Home Page](http://thomer.com/vi/vi.html)

## Install

    $ apt-get install vim-full

    $ brew install vim

    C:\> chocolatey install vim

[vim-7.3.exe](http://www.vim.org/download.php#pc)

## Configure

    ~/.vimrc

    ~/_vimrc

[Reference Dotfile](https://github.com/mcandre/dotfiles/blob/master/.vimrc)

## Repositories

[Vundle](https://github.com/gmarik/vundle)

# Basic Commands

## Modes

### Normal

By default, Vim begins in Normal mode, for entering commands. To issue a command, type `Colon`, then the command, then `Enter`. This is represented in Vim documentation with the notation `:command`.

### Insert

From Normal mode, press `i` to switch to Insert mode. Then begin typing text.

To return to Normal mode, press `ESC`.

### Visual

From Normal mode, press `v` to switch to Visual mode.

To return to Normal mode, press `ESC`.

## Open File/Directory

    $ vim <file/dir>

    $ vim
    :e <file/dir>

## View File

    $ view <file/dir>

### Windows

    C:\> vim <file/dir>

    gitbash$ vim <file/dir>

## Save

    :w

## Save As...

    :o

## Quit

    :q

## Force Quit

    :q!

## Undo

    u

## Redo

    Control+R

## Cancel Vim Command Chain

    ESC

## Next Search Result

    n

## Find

    /<term>

`n` next match.

## Replace

    :s/<term>/<replacement>/g

## Search in Directory

    :grep <term> *.?<file extensions>

## Copy Lines

    yy[n]

## Paste Lines

    p

# Navigation

## Start of Line

    I

## End of Line

    A

## Go to Line

    :<n>

## Insert Line Below

    o

## Insert Line Above

    O

## Delete

    x

    Control+D

### End of File

    G

# Help

    :h '<term>

# Windows

## Split Windows

    Control+W, S

## Switch Window

    Control+W, Control+W

## Close Window

    :hide
