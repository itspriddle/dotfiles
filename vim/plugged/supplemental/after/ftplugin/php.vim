" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Check syntax
nnoremap <leader>l :!php -l %<cr>

" Go to definition
nmap <buffer> gf <Plug>(composer-find)

" Insert use statement
nmap <buffer> gu <Plug>(composer-use)
