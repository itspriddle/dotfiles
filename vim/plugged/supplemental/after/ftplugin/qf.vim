" q to close the quickfix/location list windows
nnoremap <silent> <buffer> q :q<cr>

" Cleanup quickfix/location list windows so they're not so ugly
setlocal colorcolumn=0 nolist nobuflisted nocursorline nowrap foldcolumn=0
