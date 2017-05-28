" Run `ag` silently and load results into the quickfix/locationlist window.
"
" args - Query args, if blank default is "<cword>"
" gf   - If true, use the quickfix window, if false use locationlist
"
" Returns nothing.
function! s:ag(args, qf)
  let cmd = "ag --vimgrep "
  let cmd .= empty(a:args) ? expand("<cword>") : a:args

  exe "silent" (a:qf ? "cgetexpr" : "lgetexpr") "system(cmd)"

  let list = a:qf ? getqflist() : getloclist(0)
  let size = len(list)

  if size
    execute (a:qf ? "botright copen" : "lopen") (size > 10 ? 10 : size)
    redraw
    echo printf("Found %d matches.", size)
  else
    execute (a:qf ? "cclose" : "lclose")
    redraw
    echo "No matches found."
  endif
endfunction

" :Ag <query> - Search for <query>, add results to quickfix
" :Ag         - Search for word under cursor, add results to quickfix
command! -nargs=* -complete=file Ag call s:ag(<q-args>, 1)

" :LAg <query> - Search for <query>, add results to location-list
" :LAg         - Search for word under cursor, add results to location-list
command! -nargs=* -complete=file LAg call s:ag(<q-args>, 0)
