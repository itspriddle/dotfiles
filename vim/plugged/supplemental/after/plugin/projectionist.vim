" :AS - Open or create the associated file in a horizontal split
" :AV - Open or create the associated file in a vertical split
" :AE - Open or create the associated file in the current buffer
autocmd User ProjectionistDetect
  \ nnoremap <buffer> <leader>s :AS<cr> |
  \ nnoremap <buffer> <leader>v :AV<cr> |
  \ nnoremap <buffer> <leader>e :AE<cr>
