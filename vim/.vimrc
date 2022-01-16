"Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

"editor/UI
set relativenumber
set number
set termguicolors
set bg=dark

"Workflow and specific vim settings
"read doc :h `nohlsearch` 
syntax on
set nohlsearch 
set hlsearch
set incsearch
set autoread
set hidden  
set noerrorbells
set nowrap
set scrolloff=8
set noshowmode
set colorcolumn=80
set signcolumn=yes
set noshowcmd
set path+=**
set cot=menu,menuone,noselect
set noswapfile
"set nobackup
"set undodir=~/.vim/undodir
"set undofile
filetype plugin indent on

"Having longer updatetime (default is 4000 ms = 4s) leads to to noticeable
"delays and poor user experience.
set updatetime=100

set clipboard=unamedplus

"Mappings

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessionizer<CR>
