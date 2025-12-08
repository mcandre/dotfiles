" Install (UNIX)
"
" * Copy .vimrc to ~/.vimrc
"
" Install (Native Windows)
"
" * Copy .vimrc to ~/_vimrc

" Fix Delete (backspace) on Mac OS X
set backspace=2

" Enable syntax highlighting
syntax on

" " Indentation
" set autoindent
" filetype plugin indent on

" Use OS clipboard for copypasta
" Requires Vim's +clipboard feature to be available
"
" Homebrew fix:
"
" brew install vim --with-override-system-vi
"
" Or:
"
" ln -s vim /usr/local/bin/vi
"
set clipboard=unnamed

" Enable OS mouse clicking and scrolling
"
" Note for Mac OS X: Requires SIMBL and MouseTerm
"
" http://www.culater.net/software/SIMBL/SIMBL.php
" https://bitheap.org/mouseterm/
if has("mouse")
    set mouse=a
endif

set shell=bash\ -i

" Bash-style tab completion
set wildmode=longest,list
set wildmenu

" Fix trailing selection on visual copy/cut
set selection=exclusive

" Keep selection on visual yank
vnoremap <silent> y ygv

" Emacs-style start of line / end of line navigation
nnoremap <silent> <C-a> ^
nnoremap <silent> <C-e> $
vnoremap <silent> <C-a> ^
vnoremap <silent> <C-e> $
inoremap <silent> <C-a> <esc>^i
inoremap <silent> <C-e> <esc>$i

" Emacs-style line cutting
nnoremap <silent> <C-k> d$
vnoremap <silent> <C-k> d$
inoremap <silent> <C-k> <esc>d$i

" Fix Alt key in MacVIM GUI
" TODO - Fix in MacVIM terminal
if has("gui_macvim")
    set macmeta
endif

" Emacs-style start of file / end of file navigation
nnoremap <silent> <M-<> gg
nnoremap <silent> <M->> G$
vnoremap <silent> <M-<> gg
vnoremap <silent> <M->> G$
inoremap <silent> <M-<> <esc>ggi
inoremap <silent> <M->> <esc>G$i

" Do not attempt to fix style on paste
" set paste
" " Normally we would just `set paste`, but this interferes with other aliases.
" nnoremap <silent> p "+p

" Disable comment continuation on paste
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show line numbers
set number
" Show statusline
set laststatus=2

" Case-insensitive search
set ignorecase

" Highlight search results
set hlsearch

" Default to soft tabs, 2 spaces
set expandtab
set sw=2
set sts=2
" Except Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4

" Default to Unix LF line endings
set ffs=unix

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20

let g:vim_markdown_folding_disabled=1 " Markdown
let javaScript_fold=1                 " JavaScript
let perl_fold=1                       " Perl
let php_folding=1                     " PHP
let r_syntax_folding=1                " R
let ruby_fold=1                       " Ruby
let sh_fold_enabled=1                 " sh
let vimsyn_folding='af'               " Vim script
let xml_syntax_folding=1              " XML

" Pending https://github.com/moby/moby/pull/35267
autocmd BufRead,BufNewFile *.Dockerfile set filetype=dockerfile

autocmd BufRead,BufNewFile Vagrantfile set filetype=ruby
autocmd BufRead,BufNewFile *.Vagrantfile set filetype=ruby

autocmd BufRead,BufNewFile *.cql set filetype=cql

autocmd BufRead,BufNewFile *.yamllint set filetype=yaml

"
" Wrap window-move-cursor
"
function! s:GotoNextWindow( direction, count )
    let l:prevWinNr = winnr()
    execute a:count . 'wincmd' a:direction
    return winnr() != l:prevWinNr
endfunction

function! s:JumpWithWrap( direction, opposite )
    if ! s:GotoNextWindow(a:direction, v:count1)
        call s:GotoNextWindow(a:opposite, 999)
    endif
endfunction

nnoremap <silent> <C-w>h :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w>j :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w>k :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w>l :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
nnoremap <silent> <C-w><Left> :<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
nnoremap <silent> <C-w><Down> :<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
nnoremap <silent> <C-w><Up> :<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
nnoremap <silent> <C-w><Right> :<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
inoremap <silent> <C-w>h <esc>:<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
inoremap <silent> <C-w>j <esc>:<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
inoremap <silent> <C-w>k <esc>:<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
inoremap <silent> <C-w>l <esc>:<C-u>call <SID>JumpWithWrap('l', 'h')<CR>
inoremap <silent> <C-w><Left> <esc>:<C-u>call <SID>JumpWithWrap('h', 'l')<CR>
inoremap <silent> <C-w><Down> <esc>:<C-u>call <SID>JumpWithWrap('j', 'k')<CR>
inoremap <silent> <C-w><Up> <esc>:<C-u>call <SID>JumpWithWrap('k', 'j')<CR>
inoremap <silent> <C-w><Right> <esc>:<C-u>call <SID>JumpWithWrap('l', 'h')<CR>

"
" vim-plug dependency manager
" https://github.com/junegunn/vim-plug
"

call plug#begin('~/.vim/plugged')
    " Work around Vim corruption
    " Plug 'bruno-/vim-alt-mappings'

    Plug 'benjaminwhite/Benokai'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
    Plug 'editorconfig/editorconfig-vim'
    Plug 'elubow/cql-vim'
    Plug 'fatih/vim-go'
    Plug 'fsouza/go.vim'
    Plug 'godlygeek/tabular'
    Plug 'hashivim/vim-terraform'
    Plug 'kylelaker/riscv.vim'
    Plug 'moll/vim-bbye'
    Plug 'mtth/scratch.vim'
    Plug 'plasticboy/vim-markdown'
    Plug 'robbles/logstash.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'tomtom/tcomment_vim'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-scripts/greplace.vim'
    Plug 'vim-scripts/groovy.vim'
    Plug 'wting/rust.vim'

    " Workaround https://github.com/vim-airline/vim-airline/issues/1325
    " Plug 'bling/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
call plug#end()

" " Enable Powerline fonts for airline
" if !has("win32") && !has("win16")
"   let g:airline_powerline_fonts = 1
"   let g:airline_theme='distinguished'
" endif

" Work around PowerShell color limitations
if !has("win32") && !has("win16")
    colorscheme Benokai
endif

" " Column 80 marker
" highlight OverLength ctermbg=darkred ctermfg=white guibg=#660000
" match OverLength /\%81v.\+/

" " Currently broken due to Vim/Semicolon issues
" " Alt+; to toggle comments
" nnoremap <silent> <M-;> gc
" vnoremap <silent> <M-;> gc
" inoremap <silent> <M-;> <esc>gci

" Scratch splits the current window in half
let g:scratch_height = 0.50
" Scratch opens in Markdown format
let g:scratch_filetype = 'markdown'

" ctrlp: Exclude junk files, mainly .gitignore'd patterns
let g:ctrlp_user_command = [
    \ '.git',
    \ 'cd %s && git ls-files -co --exclude-standard | grep -vE "vendor|\\.gif|\\.jpeg|\\.jpg|\\.mp3|\\.png|\\.wav|\\.webm|\\.webp"'
\ ]

" Autolaunch NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Focus main window, not NERDTree
augroup NERD
    autocmd!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

augroup filetypedetect
    au BufRead,BufNewFile Jenkinsfile set filetype=groovy
augroup END

" Exit Vim when the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" For serious
let NERDTreeShowHidden=1

" vim-go: Enable goimports on save
let g:go_fmt_command = "goimports"
