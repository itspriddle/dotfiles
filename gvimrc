set guioptions-=T " hide toolbar
set guioptions-=r " disable right scrollbar
set guioptions-=R " disable right scrollbar
set guioptions-=l " disable left scrollbar
set guioptions-=L " disable left scrollbar


set guifont=Espresso\ Mono:h11
set guitablabel=%t
"set transparency=7

colorscheme ir_black
"colorscheme vilight

set number


"map ,t :FuzzyFinderTextMate<CR>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<

" bind command-/ to toggle comment
" requires NERD Commenter to be installed: http://www.vim.org/scripts/script.php?script_id=1218
nmap <D-/> ,c<space>
vmap <D-/> ,c<space>
imap <D-/> <C-O>,c<space>

set cursorline

" Spelling
if v:version >= 700
  set spell
endif

" Let full screen mode use the whole screen
set fuopt+=maxhorz

" binds \ T to taglist (sorta like textmate apple-shift-t)
map <leader>T :TlistToggle<CR>
let Tlist_Ctags_Cmd='/opt/local/bin/ctags'
let Tlist_Show_Menu=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Close_On_Select=1
let Tlist_Compact_Format=1
let Tlist_Enable_Fold_Column=0
let Tlist_Use_Right_Window=1

" opt-backspace: delete word
imap <M-BS>         <C-w>
" cmd-backspace: delete line
imap <D-BS>         <C-u>

" Align assignments/hashes similar to TextMate
vmap <D-M-]> :Align =I => =<CR>

