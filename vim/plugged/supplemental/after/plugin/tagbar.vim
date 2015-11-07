let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

noremap <leader>T :TagbarToggle<cr>

" Disable tagbar echoing function names
autocmd! CursorHold __Tagbar__
