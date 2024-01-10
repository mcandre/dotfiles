# Dotfiles - Configuration files

# HOMEPAGE

https://github.com/mcandre/dotfiles

# NOTABLE CONFIGURATIONS

## ASDF

[ASDF](https://asdf-vm.com/) isolates programming environments on a per-project, per-directory basis. This enables engineers to work on multiple projects with less friction about conflicting programming language versions.

Examples:

* [.tool-versions](.tool-versions) configuration for developing this dotfiles project
* Home directory default: Copy [global.tool-versions]](global.tool-versions) as `~/.tool-versions`

## EditorConfig

The [EditorConfig](https://editorconfig.org/) system provides a standard way to configure basic text file settings. It is cross-programming-language, cross-text-editor, and cross-platform. If needed, per-directory or per-project configurations can be applied, in order to support conflicting indentation styles or whathaveyou.

An thorough example [.editorconfig](.editorconfig) file sets up many projects for success.

## gitignore

[.profile.d/gitignore.sh](.profile.d/gitignore.sh) implements a CLI for the popular [gitignore.io](https://www.toptal.com/developers/gitignore) pattern database.

## ll

A common UNIX alias for rapidly listing information about files in the current directory, *in detail*.

Setup via [.profile.d/ll.sh]([.profile.d/ll.sh]).

## open

The convenient macOS [open](https://ss64.com/mac/open.html) command line tool accepts a directory or file path argument, launching the file graphically with the default application. This is helpful for quickly exploring large directory trees and project artifacts.

It is provided with the base macOS operating system. Equivalent aliases for `open` are provided in example shell configuration snippets:

* [UNIX (XDG)](.profile.d/open.x11.sh)
* [Windows (cmd.exe)](open.cmd)
* [Windows (PowerShell)](profile.ps1)

# REQUIREMENTS

* GNU or BSD [findutils](https://en.wikipedia.org/wiki/Find_(Unix))html)
* POSIX compatible [grep](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/grep.html)
* POSIX compatible [sh](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/sh.html)
* [ShellCheck](https://www.shellcheck.net/) 0.8.0+
* [Go](https://golang.org/) 1.21.5+
* [Python](https://www.python.org/) 3.12.1+
* Provision additional dev tools with `./install`

## Recommended

* [ASDF](https://asdf-vm.com/) 0.10 (run `asdf reshim` after provisioning)
* [direnv](https://direnv.net/) 2

# TERMINAL COLORS

[Monokai](http://www.reddit.com/r/commandline/comments/1q4b90/is_there_a_monokai_port_for_nano/)

# AUDIT

```console
$ ./build audit
```

# LINT

```console
$ ./build [lint]
```
