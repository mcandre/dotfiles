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

func (o *slicker) Walk(pth string, info os.FileInfo, err error) error {
	fi, er := os.Stat(pth)

	if er != nil {
		log.Print(er)
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

	fd, er := os.Open(pth)

	if er != nil {
		log.Print(er)
		o.FoundError = true
		return nil
	}

	br := bufio.NewReader(fd)

	_, er = o.Parser.Parse(br, pth)

	if er != nil {
		log.Print(er)
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
