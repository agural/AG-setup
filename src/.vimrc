" Albert Gural
" e: ag@albertgural.com
" w: http://albertgural.com
" d: 2011/06/30 - 2020/02/11

syntax on
set t_Co=256
set term=screen-256color
colorscheme hightech
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

set clipboard^=unnamed
"set clipboard^=unnamedplus

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
vnoremap d "*d
nnoremap d "*d
vnoremap y "*y
nnoremap y "*y
"nnoremap p "+p
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

" Prevent bad habits?
if 0 " No.
    nnoremap <Left>  :echoe "Use h"<CR>
    nnoremap <Right> :echoe "Use l"<CR>
    nnoremap <Up>    :echoe "Use k"<CR>
    nnoremap <Down>  :echoe "Use j"<CR>
    inoremap <Left>  <ESC>:echoe "Use h"<CR>
    inoremap <Right> <ESC>:echoe "Use l"<CR>
    inoremap <Up>    <ESC>:echoe "Use k"<CR>
    inoremap <Down>  <ESC>:echoe "Use j"<CR>
endif

nmap Q <Nop>
cmap w!! w !sudo tee % >/dev/null

if exists('+colorcolumn')
  let &colorcolumn="81,".join(range(121,1000),",")
endif

filetype plugin indent on
autocmd FileType make setlocal noexpandtab


let g:pathogen_blacklist = []
"let g:pathogen_blacklist += ['vim-codefmt', 'vim-maktaba']
let usesyntastic = (v:version < 801)
if !usesyntastic
    let g:pathogen_blacklist += ['syntastic']
endif
execute pathogen#infect()

" Airline Settings
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
" let g:airline_left_sep="⚫ "
" " 》"
" let g:airline_right_sep="⚫ "
" " 《"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
" https://github.com/vim-airline/vim-airline/wiki/Dummies-Guide-to-the-status-bar-symbols-(Powerline-fonts)-on-Fedora,-Ubuntu-and-Windows
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.paste = 'PASTE'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty='🗲 '
let g:airline_symbols.readonly = '⚠️ RO'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = ''

" Syntastic Settings
if usesyntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_aggregate_errors = 1
    "let g:syntastic_always_populate_loc_list = 1
    "let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_cpp_compiler = 'g++-8'
    let g:syntastic_cpp_compiler_options = ' -std=c++17'

    let g:syntastic_error_symbol = "✗ "
    let g:syntastic_warning_symbol = "⚠ "
    let g:syntastic_style_error_symbol = "❀ "
    let g:syntastic_style_warning_symbol = "❀ "
"else
"    let g:syntastic_html_checkers=['']
endif

" ale Settings
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'normal' "versus 'always' or 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_delay = 200
let g:ale_sign_column_always = 0

let g:ale_sign_highlight_linenrs = 1
let g:ale_set_highlights = 1

let g:ale_set_signs = 0
"let g:ale_set_sign_error = '✗ '
"let g:ale_set_sign_warning = '⚠ '
"let g:ale_sign_info = '🛈 '
"let g:ale_sign_offset = v:null
"let g:ale_sign_style_error = 'SE'
"let g:ale_sign_style_warning = 'SW'

let g:ale_warn_about_trailing_whitespace = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%: %code%] %s'
let g:airline#extensions#ale#enabled = 1
"let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']

"hi ALEWarningSign guibg=#808000 ctermbg=3
"hi ALEErrorSign   guibg=#800000 ctermbg=1
hi ALEWarning     guibg=#5f5f00 ctermbg=58
"hi ALEError       guibg=#5f0000 ctermbg=52
hi ALEError       guibg=#800000 ctermbg=1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Google code formatting
" https://github.com/google/vim-codefmt
" Use :FormatCode to apply Google format to whole buffer.
" Dependencies
"   python: pip install yapf
"   C/C++: sudo apt install clang-format
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType rust AutoFormatBuffer rustfmt
  autocmd FileType vue AutoFormatBuffer prettier
augroup END
nmap <silent> <C-b> :FormatCode<CR>
nmap <silent> <C-l> :FormatLines<CR>

" coc.nvim Settings
source ~/.vim/coc-settings.vim
set signcolumn=no
set cmdheight=1

