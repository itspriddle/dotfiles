" Go to definition
nnoremap <buffer> gf :<C-u>execute composer#autoload#find()<CR>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|execute 'unmap <buffer> gf' "
