" Albert Gural
" e: ag@albertgural.com
" w: http://albertgural.com
" d: 2011/06/30 - 2013/08/21

syntax on
set t_Co=256
set term=screen-256color
colorscheme hightech
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

set nocompatible
set hidden
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set lazyredraw

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set wildmenu
set backspace=indent,eol,start
set clipboard=unnamedplus
set pastetoggle=<F2>

set mouse=a
set nomousehide
set mousemodel=popup
set scrolloff=10
set ruler
set cursorline
set number

set foldmethod=indent
set foldlevelstart=99
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

set printoptions=paper:letter
set guioptions-=T
set vb t_vb=
set winaltkeys=no
set title
set laststatus=2
set history=1000
set undolevels=1000
set ttimeoutlen=10

nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <up> g<up>
nnoremap <down> g<down>

cmap w!! w !sudo tee % >/dev/null

if exists('+colorcolumn')
  let &colorcolumn="81,".join(range(121,1000),",")
endif

filetype plugin indent on
autocmd FileType make setlocal noexpandtab

execute pathogen#infect()
let g:airline_left_sep=" 》"
let g:airline_right_sep=" 《"

