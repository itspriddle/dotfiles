" simple-ag.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:simple_ag_loaded") && g:simple_ag_loaded
  finish
else
  let g:simple_ag_loaded = 1
endif

" Private: Run `ag` silently and open results in quickfix window/location
" list.
"
" args  - Query args, if blank default is "<cword>"
" qf    - If true, use the quickfix window, if false use location list
" count - Number of items to add
"
" Returns nothing.
function! s:ag(args, qf, count) abort
  let l:args  = (empty(a:args) ? expand("<cword>") : a:args)
  let l:count = (a:count > 0 ? a:count : get(g:, "simple_ag_max", 1000))
  let l:end   = l:count - 1
  let l:cmd   = printf(get(g:, "simple_ag_command", "ag --vimgrep %s"), l:args)
  let l:out   = ["No matches found. ", "Found %d match. ", "Found %d matches. "]

  if empty(l:args)
    echo "No search specified."
    return
  endif

  let l:start = reltime()

  let l:results = systemlist(l:cmd)

  execute "silent" (a:qf ? "cgetexpr" : "lgetexpr") "l:results[0:".l:end."]"

  let l:duration = printf("[duration: %.2f]", reltimefloat(reltime(l:start)))

  if a:qf
    call setqflist([], "r", { "title": ":Ag " . l:args })
  else
    call setloclist(0, [], "r", { "title": ":LAg " . l:args })
  endif

  if v:shell_error
    execute (a:qf ? "cclose" : "lclose")
    echo l:out[0].l:duration
  else
    execute (a:qf ? "botright copen" : "lopen") 10

    echon printf(l:out[line("$") == 1 ? 1 : 2], line("$"))

    if len(l:results) > l:count
      echohl WarningMsg
      echon printf("%d total matches. ", len(l:results))
      echohl None
    end

    echon l:duration
  end

  redraw
endfunction

" :[N]Ag <query> - Search for <query>, open results in quickfix window
" :[N]Ag         - Search for word under cursor, open results in quickfix window
command! -range=0 -nargs=* -complete=file Ag call s:ag(<q-args>, 1, <count>)

" :[N]LAg <query> - Search for <query>, open results in location list
" :[N]LAg         - Search for word under cursor, open results in location list
command! -range=0 -nargs=* -complete=file LAg call s:ag(<q-args>, 0, <count>)
