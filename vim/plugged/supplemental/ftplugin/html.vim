if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Map <leader>o to `open %` on Mac
if has("mac")
  nnoremap <buffer> <leader>o :!open %<cr>
endif

setlocal nowrap textwidth=0
