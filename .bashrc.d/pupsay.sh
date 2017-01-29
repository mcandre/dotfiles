#!/bin/sh
N="$(((RANDOM % 57) + 1))"
curl -s http://www.ascii-code.com/ascii-art/animals/dogs.php | pup "div#workarea" div "div:nth-child($N) pre"
echo "<pre>\n$1\n<pre>"
