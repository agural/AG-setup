"--------------------------------------------------------------------
" Name Of File: brookstream.vim.
" Description: Gvim colorscheme, works best with version 6.1 GUI .
" Maintainer: Peter Bäckström.
" Creator: Peter Bäckström.
" URL: http://www.brookstream.org (Swedish).
" Credits: Inspiration from the darkdot scheme.
" Last Change: Friday, April 13, 2003.
" Installation: Drop this file in your $VIMRUNTIME/colors/ directory.
"--------------------------------------------------------------------

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="brookstream"

"--------------------------------------------------------------------

hi Normal		gui=none	guibg=#000000	guifg=#c0c0c0
hi Cursor					guibg=#44ff44 	guifg=#000000
hi Directory								guifg=#44ffff
hi DiffAdd					guibg=#080808	guifg=#ffff00
hi DiffDelete				guibg=#080808	guifg=#444444
hi DiffChange				guibg=#080808	guifg=#ffffff
hi DiffText					guibg=#080808	guifg=#bb0000
hi ErrorMsg					guibg=#880000	guifg=#ffffff
hi Folded									guifg=#000088
hi IncSearch				guibg=#000000	guifg=#bbcccc
hi LineNr					guibg=#101010	guifg=#00a000
hi ModeMsg									guifg=#00ff00
hi MoreMsg						 			guifg=#44ff44
hi NonText									guifg=#4444ff
hi Question									guifg=#ffff00
hi SpecialKey								guifg=#4444ff
hi StatusLine	gui=none	guibg=#202020	guifg=#00ff00
hi StatusLineNC	gui=none	guibg=#bbbbbb	guifg=#000000		
hi Title									guifg=#00ff00
hi Visual		gui=none	guibg=#bbbbbb	guifg=#000000
hi WarningMsg								guifg=#ffff00

" syntax highlighting groups ----------------------------------------

hi Comment									guifg=#404040
hi Constant									guifg=#00aaff
hi Identifier								guifg=#00eeee
hi Statement 								guifg=#00ffff
hi PreProc									guifg=#8000ff
hi Type										guifg=#0040ff
hi Special		gui=none					guifg=#a040ff
hi Underlined	gui=bold					guifg=#4444ff
hi Ignore									guifg=#444444
hi Error		gui=bold	guibg=#ff0000	guifg=#ffffff
hi Todo			gui=bold	guibg=#ff0000	guifg=#ffff00
hi Operator 	gui=none 					guifg=#00ffff
hi Function 	 			   				guifg=#20a0ff
hi String 		gui=none 					guifg=#8080ff
hi Boolean									guifg=#0080ff

"hi link Character Constant
"hi link Number    Constant
"hi link Boolean   Constant
"hi link Float   Number
"hi link Conditional Statement
"hi link Label   Statement
"hi link Keyword   Statement
"hi link Exception Statement
"hi link Repeat    Statement
"hi link Include   PreProc
"hi link Define    PreProc
"hi link Macro   PreProc
"hi link PreCondit PreProc
"hi link StorageClass  Type
"hi link Structure Type
"hi link Typedef   Type
"hi link Tag   Special
"hi link Delimiter Special
"hi link SpecialComment  Special
"hi link Debug   Special
"hi link FoldColumn  Folded

"- end of colorscheme -----------------------------------------------	
