if ! has("gui_macvim") || ! has("gui_running")
  finish
endif

" Window settings {{{

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
set lines=70 columns=220

" Always show tab bar
set showtabline=2

" }}}

" Other settings  {{{

" Highlight column 80 and 100
set colorcolumn=80,100

" Line numbers
set number

" Highlight the current line
set cursorline

" Highlight spelling errors
set spell

" Highlight tabs and eol
set list

" Enable alt key as meta key
set macmeta

" Set window transparency to 20%
"set transparency=2

" HACK: disables audio bell by enabling visual bell which doesnt work in
" macvim right now
set visualbell

" Set default font
set guifont=Monaco:h10

" Disable blinking cursor
set gcr=a:blinkon0

" }}}

" Mappings {{{

" cmd-] to shift right
nmap <D-]> >>
vmap <D-]> >gv
imap <D-]> <C-t>

" cmd-[ to shift left
nmap <D-[> <<
vmap <D-[> <gv
imap <D-[> <C-d>

" cmd-backspace: delete line
imap <D-BS> <C-u>

" cmd-/: comment/uncomment
nmap <D-/> <C-_><C-_>
vmap <D-/> <C-_><C-_>gv
imap <D-/> <C-_><C-_>

" }}}

" Include local gvim config {{{

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif

" }}}

" vim:ft=vim:fdm=marker:ts=2:sw=2:sts=2:et
