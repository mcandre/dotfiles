" Store as ~/.emacs (Unix) or ~/_vimrc (Windows)

"
" Vundle
" https://github.com/gmarik/vundle
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto = 'git'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'fsouza/go.vim'
Bundle 'fsouza/rust.vim'
Bundle 'lsdr/monokai'

" No swap files, use version control instead
set noswapfile

" Fix bad autoindent of pasted text
set paste

" Enable syntax highlighting
syntax on

" Monokai theme
if filereadable($HOME . "/.vim/bundle/monokai/colors/monokai.vim")
   colorscheme monokai
endif

" Show line numbers
set number

" Enable auto-indentation
set autoindent
filetype plugin indent on

" Default to soft tabs, 2 spaces
set expandtab
set sw=2
set sts=2
" Except for Makefiles; hard tabs of width 2
autocmd FileType make set ts=2
" And Markdown
autocmd FileType markdown set sw=4
autocmd FileType markdown set sts=4

" Reindent on load
"autocmd FileType * normal! gg=G
" Reindent on save
"autocmd BufWritePre normal! gg=G

" Default to Unix LF line endings
set ffs=unix

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
