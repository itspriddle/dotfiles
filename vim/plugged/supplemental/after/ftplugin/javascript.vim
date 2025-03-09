" Check syntax
nnoremap <buffer> <leader>l :!node -c %<cr>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|silent! nunmap <buffer> <leader>l"
