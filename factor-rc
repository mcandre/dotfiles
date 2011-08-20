! Andrew Pennebaker
! INCLUDE/INCLUDING macros that import source code files in the current directory

USING: kernel vocabs.loader parser sequences lexer vocabs.parser ;

IN: syntax

: include-vocab ( vocab -- ) dup ".factor" append parse-file append use-vocab ;

SYNTAX: INCLUDE: scan-token include-vocab ;
SYNTAX: INCLUDING: ";" [ include-vocab ] each-token ;
