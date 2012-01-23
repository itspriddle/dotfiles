if ! has("gui_macvim")
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
set lines=48 columns=150

" }}}

" Other settings  {{{

" Highlight column 80
set colorcolumn=80

" Line numbers
set number

" Highlight the current line
set cursorline

" Show fold column
set foldcolumn=2

" Highlight spelling errors
set spell

" Highlight tabs and eol
set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Enable alt key as meta key
set macmeta

" Set window transparency to 20%
"set transparency=2

" HACK: disables audio bell by enabling visual bell which doesnt work in
" macvim right now
set visualbell

" Set default font
set guifont=Monaco:h12

" Disable blinking cursor
set gcr=a:blinkon0

" }}}

" Mappings {{{

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

" }}}

" Functions {{{

function! ToggleBG()
  let &background = ( &background == "dark" ? "light" : "dark" )
endfunction

" }}}

" Include local gvim config {{{

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif

" }}}

" vim:ft=vim:foldmethod=marker
