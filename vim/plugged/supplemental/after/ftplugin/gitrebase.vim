runtime! after/ftplugin/gitcommit.vim

" Copied from vim-git/ftplugin/gitrebase.vim
function! s:choose(word, line1, line2)
  if exists(':keeppatterns')
    execute 'keeppatterns ' a:line1 ',' a:line2 's/^\(\w\+\>\)\=\(\s*\)\ze\x\{4,40\}\>/\=(strlen(submatch(1)) == 1 ? a:word[0] : a:word) . substitute(submatch(2),"^$"," ","")/e'
  else
    execute a:line1 ',' a:line2 's/^\(\w\+\>\)\=\(\s*\)\ze\x\{4,40\}\>/\=(strlen(submatch(1)) == 1 ? a:word[0] : a:word) . substitute(submatch(2),"^$"," ","")/e'
  endif
endfunction

command! -buffer -range -bar Pick   :call s:choose('pick', <line1>, <line2>)
command! -buffer -range -bar Squash :call s:choose('squash', <line1>, <line2>)
command! -buffer -range -bar Edit   :call s:choose('edit', <line1>, <line2>)
command! -buffer -range -bar Reword :call s:choose('reword', <line1>, <line2>)
command! -buffer -range -bar Fixup  :call s:choose('fixup', <line1>, <line2>)

" TODO: think these need fixing

" Rebase shortcuts, press P, R, E, S, F to change the current line to the
" given command.
autocmd FileType gitrebase nnoremap <buffer> <silent> P :Pick<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> R :Reword<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> E :Edit<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> S :Squash<cr>
autocmd FileType gitrebase nnoremap <buffer> <silent> F :Fixup<cr>

" Same as above, but in visual mode.
autocmd FileType gitrebase vnoremap <buffer> <silent> P :Pick<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> R :Reword<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> E :Edit<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> S :Squash<cr>
autocmd FileType gitrebase vnoremap <buffer> <silent> F :Fixup<cr>
