" Rebase shortcuts, press P, R, E, S, F to change the current line to the
" given command. Press C to cycle through available commands.
nnoremap <buffer> <silent> P :Pick<cr>
nnoremap <buffer> <silent> R :Reword<cr>
nnoremap <buffer> <silent> E :Edit<cr>
nnoremap <buffer> <silent> S :Squash<cr>
nnoremap <buffer> <silent> F :Fixup<cr>
nnoremap <buffer> <silent> C :Cycle<cr>

" Same as above, but in visual mode. Highlight the previously selected text
" after changes.
vnoremap <buffer> <silent> P :s/^\w\+/pick/e<cr>`[v`]
vnoremap <buffer> <silent> R :s/^\w\+/reword/e<cr>`[v`]
vnoremap <buffer> <silent> E :s/^\w\+/edit/e<cr>`[v`]
vnoremap <buffer> <silent> S :s/^\w\+/squash/e<cr>`[v`]
vnoremap <buffer> <silent> F :s/^\w\+/fixup/e<cr>`[v`]
vnoremap <buffer> <silent> C :s/^\w\+/cycle/e<cr>`[v`]
