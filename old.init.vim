syntax enable

set guifont=VictorMono_Nerd_Font_Mono:h11
set encoding=UTF-8

" Line number
set cursorline
set number
set relativenumber
set scl=no
set colorcolumn=81
" Indentation
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2

filetype on
filetype indent plugin on

" Mapping {{{

" Remap leader to spacebar
nnoremap <Space> <Nop>
let mapleader=" "

" split movement
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Moving line
" ∆ = <A-j>
" ˚ = <A-k>
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <ESC>:m .+1<CR>==gi
inoremap ˚ <ESC>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Save with leader-s
nmap <silent> <leader>s :w<CR>
