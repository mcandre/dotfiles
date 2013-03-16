" Store as ~/.emacs (Unix) or ~/_vimrc (Windows)

" Enable syntax highlighting
syntax on

" Monokai-like theme
colorscheme molokai

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
:set fileformat=unix