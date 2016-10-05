" Quickfix windows

augroup ft_quickfix
  autocmd!

  " Quickfix windows always on bottom, full window width
  autocmd FileType qf wincmd J | resize 10 | nnoremap <silent> <buffer> q :q<cr>

  " Cleanup quickfix windows so they're not so ugly
  autocmd BufNewFile,BufRead *
    \ if &bt =~# '^\%(quickfix\|nofile\)$' |
    \   setlocal colorcolumn=0 nolist nobuflisted nocursorline nowrap foldcolumn=0 |
    \ endif
augroup END
