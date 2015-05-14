" Based on $VIMRUNTIME/colors/default.vim
"
" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
highlight clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "default-josh"

" Make search, pmenu, and spell highlighting readable in console Vim
if ! has('gui_running')
  highlight SpellCap   ctermbg=81  ctermfg=0   term=reverse
  highlight SpellBad   ctermbg=224 ctermfg=0   term=reverse
  highlight Search     ctermbg=221 ctermfg=235 term=reverse
  highlight Pmenu      ctermbg=225 ctermfg=0
  highlight PmenuSel   ctermbg=7   ctermfg=0
  highlight PmenuSbar  ctermbg=248
  highlight PmenuThumb ctermbg=0
endif
