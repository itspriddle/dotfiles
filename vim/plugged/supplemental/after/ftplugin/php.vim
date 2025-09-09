" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Check syntax

" Open or create the associated file in a horizontal split
nnoremap <buffer> <leader>s :AS<cr>

" Open or create the associated file in a vertical split
nnoremap <buffer> <leader>v :AV<cr>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal commentstring< list< tabstop< shiftwidth< softtabstop< expandtab<" .
  \ "|execute 'unmap <buffer> <leader>s'" .
  \ "|execute 'unmap <buffer> <leader>v'"
