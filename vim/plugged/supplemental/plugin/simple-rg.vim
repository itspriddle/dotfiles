" simple-rg.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:simple_rg_loaded") && g:simple_rg_loaded
  finish
else
  let g:simple_rg_loaded = 1
endif

" Private: Run `rg` silently and open results in quickfix window/location
" list.
"
" args  - Query args, if blank default is "<cword>"
" qf    - If true, use the quickfix window, if false use location list
" limit - If true, limit to g:simple_rg_max entries (default: 1000)
"
" Returns nothing.
function! s:rg(args, qf, limit) abort
  let l:args  = (empty(a:args) ? expand("<cword>") : a:args)
  let l:count = (a:limit ? -1 : (get(g:, "simple_rg_max", 1000) - 1))
  let l:cmd   = printf(get(g:, "simple_rg_command", "rg --vimgrep %s"), l:args)
  let l:out   = ["No matches found. ", "Found %d match. ", "Found %d matches. "]

  if empty(l:args)
    echo "No search specified."
    return
  endif

  let l:start = reltime()

  let l:results = systemlist(l:cmd)

  execute "silent" (a:qf ? "cgetexpr" : "lgetexpr") "l:results[0:".l:count."]"

  let l:duration = printf("[duration: %.2f]", reltimefloat(reltime(l:start)))

  if a:qf
    call setqflist([], "r", { "title": ":Rg " . l:args })
  else
    call setloclist(0, [], "r", { "title": ":LRg " . l:args })
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

" :Rg[!] <query> - Search for <query>, open results in quickfix window
" :Rg[!]         - Search for word under cursor, open results in quickfix window
command! -bang -nargs=* -complete=file Rg call s:rg(<q-args>, 1, <bang>0)

" :LRg[!] <query> - Search for <query>, open results in location list
" :LRg[!]         - Search for word under cursor, open results in location list
command! -bang -nargs=* -complete=file LRg call s:rg(<q-args>, 0, <bang>0)
