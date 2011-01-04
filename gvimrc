if has("gui_macvim")
  set macmeta

  " Command-T opens PeepOpen
  macmenu &File.New\ Tab key=<nop>
  map <D-t> <Plug>PeepOpen

  " Let full screen mode use the whole screen
  set fuopt+=maxhorz
end

set gcr=a:blinkon0 " No blinking cursor
set guioptions-=T  " hide toolbar
set guioptions-=r  " disable right scrollbar
set guioptions-=R  " disable right scrollbar
set guioptions-=l  " disable left scrollbar
set guioptions-=L  " disable left scrollbar

set guifont=Espresso\ Mono:h11
set guitablabel=%M%t


set number
set cursorline

set spell

set nowrap


" Highlight tabs and eol
set listchars=tab:▸\ ,eol:¬,trail:·
set list

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >>
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <<
imap <D-[> <C-O><<


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
imap <M-BS> <C-w>

" cmd-backspace: delete line
imap <D-BS> <C-u>

" Align assignments/hashes similar to TextMate
vmap <D-M-]> :Align =I => =<CR>

" Bind CMD-/ to comments (Like TextMate)
nmap <D-/> <C-_><C-_><space>
vmap <D-/> <C-_><C-_><space>
imap <D-/> <C-_><C-_><space>

colorscheme ir_black

