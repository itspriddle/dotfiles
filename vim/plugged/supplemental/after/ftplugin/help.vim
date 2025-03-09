" Usq q to :quit help buffer
nnoremap <silent> <buffer> q :if !&ma <bar> q <bar> endif<cr>

" Cleanup display
setlocal colorcolumn=0 nolist nocursorline nowrap foldcolumn=0

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|silent! nunmap <buffer> q" .
  \ "|setlocal colorcolumn< nolist< nocursorline< nowrap< foldcolumn<"
