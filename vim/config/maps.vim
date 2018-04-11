" ------------------------------------------------------------------------------
" General Mappings
"
" Mappings that aren't related to third-party plugins.
" ------------------------------------------------------------------------------

" Use the , key as <Leader>
let g:mapleader = ','

" Repeat latest f, t, F or T in opposite direction (normally , but set to \
" since , is used as <Leader>)
nnoremap \ ,

" Remap space to :
noremap <space> :

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" Format paragraph
vnoremap <C-q> gq
nnoremap <C-q> gqap
inoremap <C-q> <C-o>gqap

" ctrl+j/ctrl+k to move up/down in insert mode
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" Cycle through open buffers (C-z with 'wildcharm' triggers the wildmenu)
nnoremap <leader>B :buffer <C-z>

" Shortcut for typing :help
nnoremap <leader>h :help<space>

" ^<space> to Insert space before selection
vnoremap <C-@> I<space><esc>gv

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Disable F1 help menu
nnoremap <F1> <nop>
inoremap <F1> <nop>

" Repeat last change for selection
vnoremap . :norm.<CR>

" Override ^w T to keep the existing buffer
map <C-w>T :exe "tabnew +" . line(".") . " %"<cr>

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
