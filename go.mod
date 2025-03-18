module github.com/mcandre/dotfiles

go 1.24

tool (
	github.com/mcandre/slick/cmd/slick
	github.com/mcandre/stank
	github.com/mcandre/stank/cmd/funk
	github.com/mcandre/stank/cmd/stank
	github.com/mcandre/stank/cmd/stink
	mvdan.cc/sh/v3/cmd/shfmt
)

require (
	github.com/google/renameio/v2 v2.0.0 // indirect
	github.com/magefile/mage v1.15.0 // indirect
	github.com/mcandre/mage-extras v0.0.23 // indirect
	github.com/mcandre/slick v0.0.12 // indirect
	github.com/mcandre/stank v0.0.33 // indirect
	github.com/rogpeppe/go-internal v1.13.1 // indirect
	golang.org/x/sys v0.30.0 // indirect
	golang.org/x/term v0.25.0 // indirect
	mvdan.cc/editorconfig v0.3.0 // indirect
	mvdan.cc/sh/v3 v3.10.0 // indirect
)
