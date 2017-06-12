#!/bin/bash

case "$(uname -s)" in
    Darwin )
        LS='gls'
        ;;
    * )
        LS='ls'
        ;;
esac

export LS

alias ls='$LS --color=auto'
