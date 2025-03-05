// Package main implements a POSIX sh syntax validation CLI application.
package main

import (
	"github.com/mcandre/slick"
	"mvdan.cc/sh/v3/syntax"

	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
)

var flagSyntaxCheck = flag.Bool("n", false, "Validate syntax")
var flagVersion = flag.Bool("version", false, "Show version information")
var flagHelp = flag.Bool("help", false, "Show usage information")

type slicker struct {
	Parser     *syntax.Parser // /!\ Nonconcurrent /!\
	FoundError bool
}

func newSlicker() slicker {
	return slicker{
		Parser: syntax.NewParser(syntax.Variant(syntax.LangPOSIX)),
	}
}

func (o *slicker) Walk(pth string, _ os.FileInfo, _ error) error {
	fi, err2 := os.Stat(pth)

	if err2 != nil {
		log.Print(err2)
		o.FoundError = true
		return nil
	}

	// Skip trying to parse directory paths
	if fi.Mode().IsDir() {
		return nil
	}

	// Attempt to short-circuit for Emacs and vi swap files
	if strings.HasSuffix(pth, "~") || strings.HasSuffix(pth, ".swp") {
		return nil
	}

	fd, err2 := os.Open(pth)

	if err2 != nil {
		log.Print(err2)
		o.FoundError = true
		return nil
	}

	br := bufio.NewReader(fd)

	_, err2 = o.Parser.Parse(br, pth)

	if err2 != nil {
		log.Print(err2)
		o.FoundError = true
	}

	return nil
}

func main() {
	flag.Parse()

	s := newSlicker()

	switch {
	case *flagSyntaxCheck:
		paths := flag.Args()

		for _, pth := range paths {
			filepath.Walk(pth, s.Walk)
		}

		if s.FoundError {
			os.Exit(1)
		}
	case *flagVersion:
		fmt.Println(slick.Version)
	case *flagHelp:
		flag.PrintDefaults()
	}
}
