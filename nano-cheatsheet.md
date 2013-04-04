# Nano Cheatsheet

Andrew Pennebaker

https://github.com/mcandre/dotfiles/blob/master/nano-cheatsheet.md

## Documentation

http://www.nano-editor.org/dist/v2.2/nano.html

## Install

    $ apt-get install nano

    $ brew install nano

    C:\> chocolatey install nano

[nano-2.2.5.msi](http://www.yellosoft.us/helpers#nano)

## Configure

    ~/.nanorc

[Dotfile](https://github.com/mcandre/dotfiles/blob/master/nanorc)

# Basic Commands

## Hotkey Notation

* `^` = `Control`
* `M-` = `Alt` ("Meta" key)

## Open File

    $ nano <file>

    $ nano
    ^R <file>

### Windows

    C:\> nano <file>

    gitbash$ nano <file>

## Save As...

    ^O

## Quit

    ^X

## Undo/Redo

    M-U

    M-E

## Cancel Nano Command

    ^C

## Next Search Result

    ^W

## Find and Replace

    ^\
    A

## Regular Expressions

    ^W
    M-R

    ^\
    M-R

## Cut

    ^K

## Copy

    M-6

## Paste

    ^U

## Set mark

    M-A

## Indent/Dedent Line or Marked Block Rigidly

    M-}

    M-{

## Auto-Indent Current Line or Marked Region

    TAB

## Start/End of File

    M-\

    M-/

## Start/End of Line

    ^A

    ^E

### Delete

    DEL
