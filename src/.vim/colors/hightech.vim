"===========================================================================================+
"                        _   _ ___ ____ _   _ _____ _____ ____ _   _                        "
"                       | | | |_ _/ ___| | | |_   _| ____/ ___| | | |	                      "
"                       | |_| || | |  _| |_| | | | |  _|| |   | |_| |                       "
"                       |  _  || | |_| |  _  | | | | |__| |___|  _  |                       "
"                       |_| |_|___\____|_| |_| |_| |_____\____|_| |_|                       "
"                                                                                           "
"===========================================================================================+

"-------------------------------------------------------------------------------------------+
" Name Of File: hightech.vim.
" ColorScheme:  hightech.
" Description:  Vim and Gvim cool, dark colorscheme.
" Maintainer:   Albert Gural.
" Creator:      Albert Gural. 
" URL:          http://www.albertgural.com 
" Credits:      Inspiration from the darkdot scheme.
" Started:      Thursday - June 30, 2011.
" Last Change:  Wednesday - February 12, 2020.
" Installation: Place in ~/.vim/colors directory.
"-------------------------------------------------------------------------------------------+


"------------------------------------ VIM Pre-Processing -----------------------------------+ 

"set background=dark
hi clear
if exists("syntax_on")
    syntax reset
    endif
let g:colors_name="hightech"

"------------------------------- VIM General Highlighting ----------------------------------+ 

hi Normal	      gui=none  guifg=#c0c0c0 	             	cterm=none  ctermfg=251
hi StatusLine   gui=none  guifg=#00ff00  guibg=#202020 	cterm=none  ctermfg=46   ctermbg=234
hi StatusLineNC gui=none  guifg=#000000  guibg=#bbbbbb 	cterm=none  ctermfg=16   ctermbg=250
hi Visual       gui=none  guifg=#000000  guibg=#bbbbbb 	cterm=none  ctermfg=16   ctermbg=250
hi Cursor                 guifg=#000000  guibg=#44ff44              ctermfg=16   ctermbg=83
hi ColorColumn                           guibg=#121212                           ctermbg=233
hi CursorLine                            guibg=#121212                           ctermbg=233
hi DiffAdd                guifg=#ffff00  guibg=#080808              ctermfg=226  ctermbg=232
hi DiffDelete             guifg=#444444  guibg=#080808              ctermfg=238  ctermbg=232
hi DiffChange             guifg=#ffffff  guibg=#080808              ctermfg=231  ctermbg=232
hi DiffText               guifg=#bb0000  guibg=#080808              ctermfg=124  ctermbg=232
hi ErrorMsg               guifg=#ffffff  guibg=#880000              ctermfg=231  ctermbg=88
hi IncSearch              guifg=#bbcccc  guibg=#000000              ctermfg=251  ctermbg=16
hi LineNr                 guifg=#00a000  guibg=#101010              ctermfg=34   ctermbg=233
hi Directory              guifg=#44ffff                             ctermfg=87
hi Folded                 guifg=#000088                             ctermfg=18
hi ModeMsg                guifg=#00ff00                             ctermfg=46
hi MoreMsg                guifg=#44ff44                             ctermfg=83
hi NonText                guifg=#4444ff                             ctermfg=63
hi Question               guifg=#ffff00                             ctermfg=226
hi SpecialKey             guifg=#4444ff                             ctermfg=63
hi Title                  guifg=#00ff00                             ctermfg=46
hi WarningMsg             guifg=#ffff00                             ctermfg=226

"-------------------------------- Syntax Highlighting Groups -------------------------------+ 

hi Error        gui=bold  guifg=#ffffff  guibg=#ff0000  cterm=bold  ctermfg=231  ctermbg=196
hi Todo         gui=bold  guifg=#ffff00  guibg=#ff0000  cterm=bold  ctermfg=226  ctermbg=196
hi Statement    gui=bold  guifg=#00ffff                 cterm=bold  ctermfg=51
hi Type         gui=bold  guifg=#0040ff                 cterm=bold  ctermfg=27
hi Special      gui=none  guifg=#a040ff                 cterm=none  ctermfg=135
hi Underlined   gui=bold  guifg=#4444ff                 cterm=bold  ctermfg=63
hi Operator     gui=none  guifg=#00ffff                 cterm=none  ctermfg=51
hi String       gui=none  guifg=#8080ff                 cterm=none  ctermfg=105
hi Boolean      gui=bold  guifg=#0080ff                 cterm=bold  ctermfg=39
hi Comment                guifg=#404040                             ctermfg=238
hi Constant               guifg=#00aaff                             ctermfg=39
hi Identifier             guifg=#00eeee                             ctermfg=51
hi PreProc                guifg=#8000ff                             ctermfg=93
hi Ignore                 guifg=#444444                             ctermfg=238
hi Function               guifg=#20a0ff                             ctermfg=39

"---------------------------------- Additional VIM Options ---------------------------------+ 

"hi link Character        Constant
"hi link Number           Constant
"hi link Boolean          Constant
"hi link Float            Number
"hi link Conditional      Statement
"hi link Label            Statement
"hi link Keyword          Statement
"hi link Exception        Statement
"hi link Repeat           Statement
"hi link Include          PreProc
"hi link Define           PreProc
"hi link Macro            PreProc
"hi link PreCondit        PreProc
"hi link StorageClass     Type
"hi link Structure        Type
"hi link Typedef          Type
"hi link Tag              Special
"hi link Delimiter        Special
"hi link SpecialComment   Special
"hi link Debug            Special
"hi link FoldColumn       Folded
hi Pmenu                  guifg=#00ff00  guibg=#585858              ctermfg=10   ctermbg=240
hi PmenuSel               guifg=#00ffff  guibg=#808080              ctermfg=14   ctermbg=244
hi PmenuSbar                             guibg=#444444                           ctermbg=238
hi PmenuThumb                            guibg=#a8a8a8                           ctermbg=248

"---------------------------- End Of hightech.vim Color Scheme -----------------------------+



