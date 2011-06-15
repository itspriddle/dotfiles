if has("gui_macvim")
  set macmeta

  " Let full screen mode use the whole screen
  set fuopt+=maxhorz

  " Set window transparency to 20%
  "set transparency=2

  " HACK: disables audio bell by enabling visual bell
  " which doesnt work in macvim right now
  set visualbell

  " Set default font
  set guifont=Espresso\ Mono:h12
  "set guifont=Monaco:h12

  " Light bg from 7AM - 7PM
  let s:hr = str2nr(strftime('%H'))
  if s:hr < 7 || s:hr > 19
    set bg=dark
  else
    set bg=light
  endif
endif

" Disable blinking cursor
set gcr=a:blinkon0

" Hide toolbar and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Label/tabbar title
set guitablabel=%t
set title titlestring=%f

" Default window size
set lines=48 columns=150

" Highlight the current line
set cursorline

" Highlight spelling errors
set spell

" Highlight tabs and eol
set list listchars=tab:▸\ ,eol:¬,trail:·

function! ToggleBG()
  if &bg == 'light'
    set bg=dark
  else
    set bg=light
  endif
endfunction

map <leader>bg :call ToggleBG()<cr>

" cmd-] to shift right
nmap <D-]> >>
vmap <D-]> >gv
imap <D-]> <C-O>>>

" cmd-[ to shift left
nmap <D-[> <<
vmap <D-[> <gv
imap <D-[> <C-O><<

" opt-backspace: delete word
imap <M-BS> <C-w>

" cmd-backspace: delete line
imap <D-BS> <C-u>

" cmd-/: comment/uncomment
nmap <D-/> <C-_><C-_>
vmap <D-/> <C-_><C-_>gv
imap <D-/> <C-_><C-_>

" vim:set ft=vim:
