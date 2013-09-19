# Emacs Cheatsheet

Andrew Pennebaker

https://github.com/mcandre/dotfiles/blob/master/emacs-cheatsheet.md

## Documentation

http://emacswiki.org/

## Install

    $ apt-get install emacs

    $ brew install emacs

    C:\> chocolatey install Emacs

[emacs-24.2.msi](http://www.yellosoft.us/helpers#emacs)

## Configure

    ~/.emacs

[Reference Dotfile](https://github.com/mcandre/dotfiles/blob/master/.emacs)

## Hotkey Notation

* `C-` = `Control`
* `M-` = `Alt` ("Meta" key)
* `S-` = `Shift`
* `key-key key-key key-key...` = Hotkeys are pressed in order, not simultaneously.

## Evaluate Elisp Code

    M-: (<code...>)

    M-x <code>

## System Commands

    M-x shell

    M-x eshell

    M-! <command>

## Packages

    (package-refresh-contents)

    (package-install '<package>)

## Repositories

[Marmalade](http://marmalade-repo.org/)

[MELPA](http://melpa.milkbox.net/)

# Basic Commands

## Open File/Directory

    $ emacs <file/dir>

    $ emacs
    C-x C-f <file/dir>

## View File

    $ emacs
    M-x view-file RET <file>

### Windows

    C:\> runemacs <file/dir>

    gitbash$ runemacs <file/dir>

    gitbash$ emacs <file/dir> &

## Save

    C-x C-s

## Save As...

    C-x C-w

## Quit

    C-x C-c

## Undo/Redo

    C-_

## Cancel Emacs Command Chain

    C-g

## Next Search Result

    C-s

## Find and Replace

Find/Replace from cursor to end of file:

    M-%

Wrap:

    C-s

Enter text to find.
Enter text to replace.

`!` replaces all occurences.

`y` replace current match.

`n` skips over current match.

## Search in Directory

    M-x rgrep

## Regular Expressions

Emacs supports a regex syntax similar to PPCRE.

http://emacswiki.org/emacs/RegularExpression

## Select All

    C-x h

## Cut

    C-w

## Copy

    M-w

## Paste

    C-y

## Set mark

    C-space

## Toggle Comment Marked Region

    M-;

## Auto-Indent Current Line or Marked Region

    TAB

## Insert literal Tab Character

    C-q TAB

## Indent Marked Region Rigidly

    M-x (indent-rigidly (region-beginning) (region-end) tab-width))

    C-c >

## Outdent Marked Region Rigidly

    M-x (indent-rigidly (region-beginning) (region-end (* tab-width -1))

    C-c <

# Screens

## Windows

### Split Window Verticaly

    C-x 2

## Split Window Horizontally

    C-x 3

### Next Window

    C-x o

### Close Window

    C-x 0

## Buffers

### Create or Switch to Buffer

    C-x b <name (default *scratch)>

### Set buffer mode

    M-x <mode-name>

### Start of Buffer

    M-<

### End of Buffer

    M->

### Start of Line

    C-a

### End of Line

    C-e

### Delete

    C-d

### Cut Line

    C-k

# Help

## Variables

    C-h v <name>

## Hotkeys

    C-h k <key>

# IRC

    M-x irc
