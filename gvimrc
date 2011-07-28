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
  set guifont=Monaco:h12
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

" Line numbers
set number

" Default window size
set lines=48 columns=150

" Highlight the current line
set cursorline

" Highlight spelling errors
set spell

" Highlight tabs and eol
set list listchars=tab:▸\ ,eol:¬,trail:·

function! ToggleBG()
  let &background = ( &background == "dark" ? "light" : "dark" )
endfunction

map <leader>bg :call ToggleBG()<cr>

" Format paragraph
vmap <C-q> gq
nmap <C-q> gqap
imap <C-q> <C-o>gqap

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

" Include local vim config
if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif

" vim:set ft=vim:
