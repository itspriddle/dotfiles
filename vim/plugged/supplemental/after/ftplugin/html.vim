" Map <leader>o to `open %` on Mac
if has("mac")
  nnoremap <buffer> <leader>o :!open %<cr>

  let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
    \ "|silent! nunmap <buffer> <leader>o"
endif

setlocal nowrap textwidth=0

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal nowrap< textwidth<"
