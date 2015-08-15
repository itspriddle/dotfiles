runtime! after/ftplugin/gitcommit.vim

" Rebase shortcuts, press P, R, E, S, F to change the current line to the
" given command. Press C to cycle through available commands.
autocmd FileType gitrebase nnoremap <buffer> <silent> P :Pick<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> R :Reword<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> E :Edit<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> S :Squash<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> F :Fixup<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> C :Cycle<cr>

" Same as above, but in visual mode.
autocmd FileType gitrebase vnoremap <buffer> <silent> P :s/^\w\+/pick/e<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> R :s/^\w\+/reword/e<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> E :s/^\w\+/edit/e<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> S :s/^\w\+/squash/e<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> F :s/^\w\+/fixup/e<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> C :s/^\w\+/cycle/e<cr>
