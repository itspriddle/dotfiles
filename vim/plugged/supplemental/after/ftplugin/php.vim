" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use hard-tabs to place nicely with most of the world
setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" Check syntax
nnoremap <leader>l :!php -l %<cr>
