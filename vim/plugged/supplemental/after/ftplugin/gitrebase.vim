runtime! after/ftplugin/gitcommit.vim

" Rebase shortcuts, press P, R, E, S, F to change the current line to the
" given command.
nnoremap <buffer> <silent> P :Pick<cr>
nnoremap <buffer> <silent> R :Reword<cr>
nnoremap <buffer> <silent> E :Edit<cr>
nnoremap <buffer> <silent> S :Squash<cr>
nnoremap <buffer> <silent> F :Fixup<cr>

" Same as above, but in visual mode.
vnoremap <buffer> <silent> P :Pick<cr>
vnoremap <buffer> <silent> R :Reword<cr>
vnoremap <buffer> <silent> E :Edit<cr>
vnoremap <buffer> <silent> S :Squash<cr>
vnoremap <buffer> <silent> F :Fixup<cr>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|silent! nunmap <buffer> <silent> P" .
  \ "|silent! nunmap <buffer> <silent> R" .
  \ "|silent! nunmap <buffer> <silent> E" .
  \ "|silent! nunmap <buffer> <silent> S" .
  \ "|silent! nunmap <buffer> <silent> F"
