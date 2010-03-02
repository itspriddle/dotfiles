" Maintainer:	Joshua Priddle
" Last Change:	August 14, 2009

set background=light

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "classic"


" Vim >= 7.0 specific colors
if version >= 700
  hi CursorLine guibg=#2d2d2d
  hi CursorColumn guibg=#2d2d2d
  hi MatchParen guifg=#f6f3e8 guibg=#857b6f gui=bold
  hi Pmenu 		guifg=#f6f3e8 guibg=#444444
  hi PmenuSel 	guifg=#000000 guibg=#cae682
endif

" General colors
hi Cursor 		guifg=NONE    guibg=#4D4D4D gui=none
hi Normal 		guifg=#FFFFFF guibg=#000000 gui=none
hi NonText 		guifg=#0000cc guibg=NONE    gui=none
hi LineNr 		guifg=#857b6f guibg=#000000 gui=none
hi StatusLine 	guifg=#f6f3e8 guibg=#444444 gui=italic
hi StatusLineNC guifg=#857b6f guibg=#444444 gui=none
hi VertSplit 	guifg=#444444 guibg=#444444 gui=none
hi Folded 		guibg=#384048 guifg=#a0a8b0 gui=none
hi Title		guifg=#f6f3e8 guibg=NONE	gui=bold
hi Visual		guifg=#f6f3e8 guibg=#444444 gui=none
hi SpecialKey	guifg=#808080 guibg=#343434 gui=none

" Syntax highlighting
hi Comment      guifg=#0000cc gui=none
hi Todo         guifg=#0000cc gui=none
hi Constant     guifg=#cc0000 gui=none
hi String       guifg=#cc0000 gui=none
hi Identifier   guifg=#00cccc gui=none
hi Function     guifg=#00cccc gui=none
hi Type         guifg=#00cc00 gui=none
hi Statement    guifg=#cccc00 gui=none
hi Keyword      guifg=#cc00cc gui=none
hi PreProc      guifg=#cc00cc gui=none
hi Number       guifg=#cc0000 gui=none
hi Special      guifg=#cc00cc gui=none

