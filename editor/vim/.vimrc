set nocompatible
set history=500
set mouse=a
set encoding=utf8

filetype plugin on
filetype indent on


syntax on

set wildmenu
set ruler
set hlsearch
set showmatch

set noerrorbells
set novisualbell

set nobackup
set nowb
set noswapfile

set expandtab
set smarttab

execute pathogen#infect()
call pathogen#helptags()

" PLUGINS

" lightline
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
