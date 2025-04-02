" Usq q to :quit help buffer
nnoremap <silent> <buffer> q :if !&ma <bar> q <bar> endif<cr>

" Disable : ... probably a horrible idea?
nnoremap <silent> <buffer> : <nop>
nnoremap <silent> <buffer> <space> <nop>

" Cleanup display
setlocal colorcolumn=0 nolist nocursorline nowrap foldcolumn=0 laststatus=0

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|silent! nunmap <buffer> q" .
  \ "|silent! nunmap <buffer> :" .
  \ "|setlocal colorcolumn< nolist< nocursorline< nowrap< foldcolumn< laststatus<"
