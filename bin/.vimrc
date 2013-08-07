" Albert Gural
" e: ag@albertgural.com
" w: http://albertgural.com
" d: 2011/06/30 - 2013/08/07

set t_Co=256
set term=screen-256color

colorscheme hightech


syntax on 
set tw=80
set cb="exclude:.*"
set nocompatible
set mouse=a
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set showmatch
set guioptions-=T
set vb t_vb=
set ruler
set incsearch
set nu


function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec ('match RightMargin /\%>' . &textwidth . 'v.\+/')
  endif
endfunction

augroup highlight_toolong2
  au!
  au WinEnter,BufNewFile,BufRead * call HighlightTooLongLines()
augroup END

