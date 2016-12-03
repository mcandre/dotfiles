#!/bin/bash

function gitignore {
    curl -L -s "https://www.gitignore.io/api/$1"
}
