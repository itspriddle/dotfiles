set guioptions-=T " hide toolbar
set guioptions-=r " disable right scrollbar
set guioptions-=R " disable right scrollbar
set guioptions-=l " disable left scrollbar
set guioptions-=L " disable left scrollbar


set guifont=Espresso\ Mono:h11
set guitablabel=%t
"set transparency=7

"colorscheme sunburst
"colorscheme ir_black
colorscheme desert

set number

map ,t :FuzzyFinderTextMate<CR>

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

