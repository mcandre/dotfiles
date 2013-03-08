# Emacs Cheatsheet

Andrew Pennebaker

https://github.com/mcandre/dotfiles/blob/master/emacs-cheatsheet.md

## Install

	$ apt-get install emacs

	$ brew install emacs

	C:\> chocolatey install Emacs

[emacs-24.2.msi](http://www.yellosoft.us/helpers#emacs)

## Configure

	~/.emacs

	[Dotfile](https://github.com/mcandre/dotfiles/blob/master/emacs)

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

### Windows

	C:\> runemacs <file/dir>

	gitbash$ runemacs <file/dir>

	gitbash$ emacs <file/dir> &

## Save

	C-x C-s

## Quit

	C-x C-c

## Undo/Redo

	C-_

## Cancel Emacs Command Chain

	C-g

## Next Search Result

	C-s

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

# Screens

## Windows

### Split Window Verticaly

	C-x 2

### Next Window

	C-x o

### Close Window

	C-x 0

## Buffers

### Switch to Buffer

	C-x b <name (default *scratch)>

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
