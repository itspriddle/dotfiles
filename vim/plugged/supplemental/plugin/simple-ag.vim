" simple-ag.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)
"
" Partially based on https://github.com/mhinz/vim-grepper

if &cp || exists("g:simple_ag_loaded") && g:simple_ag_loaded
  finish
else
  let g:simple_ag_loaded = 1
endif

" Private: Run `ag` silently and open results in quickfix window/location
" list.
"
" args - Query args, if blank default is "<cword>"
" qf   - If true, use the quickfix window, if false use location list
"
" Returns nothing.
function! s:ag(args, qf) abort
  let cmd = "ag --vimgrep " . (empty(a:args) ? expand("<cword>") : a:args)

  execute "silent" (a:qf ? "cgetexpr" : "lgetexpr") "system(cmd)"

  let list = a:qf ? getqflist() : getloclist(0)
  let size = len(list)

  " Hack so we can set the title in `:chistory` and `:lhistory` :(
  if a:qf
    call setqflist(list, "r", { "title": cmd })
  else
    call setloclist(0, list, "r", { "title": cmd })
  endif

  if size
    execute (a:qf ? "botright copen" : "lopen") 10
    echo size == 1 ? "Found 1 match." : printf("Found %d matches.", size)
  else
    execute (a:qf ? "cclose" : "lclose")
    echo "No matches found."
  endif

  redraw
endfunction

" :Ag <query> - Search for <query>, open results in quickfix window
" :Ag         - Search for word under cursor, open results in quickfix window
command! -nargs=* -complete=file Ag call s:ag(<q-args>, 1)

" :LAg <query> - Search for <query>, open results in location list
" :LAg         - Search for word under cursor, open results in location list
command! -nargs=* -complete=file LAg call s:ag(<q-args>, 0)
