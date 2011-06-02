if has("gui_macvim")
  set macmeta

  " Let full screen mode use the whole screen
  set fuopt+=maxhorz

  " Set window transparency to 20%
  "set transparency=2
end

" HACK: disables audio bell by enabling visual bell
" which doesnt work in macvim right now
set visualbell

set gcr=a:blinkon0 " No blinking cursor
set guioptions-=T  " hide toolbar
set guioptions-=r  " disable right scrollbar
set guioptions-=R  " disable right scrollbar
set guioptions-=l  " disable left scrollbar
set guioptions-=L  " disable left scrollbar

set guifont=Espresso\ Mono:h12
"set guifont=Monaco:h12
set guitablabel=%t
set title titlestring=%f

" Default window size
set lines=48 columns=150


" Highlight the current line
set cursorline

set spell

set nowrap


" Highlight tabs and eol
set listchars=tab:▸\ ,eol:¬,trail:·
set list


function! ToggleBG()
  if &bg == 'light'
    set bg=dark
  else
    set bg=light
  endif
endfunction

map <leader>bg :call ToggleBG()<cr>

" bind command-] to shift right
nmap <D-]> >>
vmap <D-]> >gv
imap <D-]> <C-O>>>

" bind command-[ to shift left
nmap <D-[> <<
vmap <D-[> <gv
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

" Bind CMD-/ to comments (Like TextMate)
nmap <D-/> <C-_><C-_>
vmap <D-/> <C-_><C-_>gv
imap <D-/> <C-_><C-_>


