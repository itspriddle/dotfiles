" Grepper.vim

" Disable helper commands I don't use
let cmds = [
  \ ['GrepperAck',     'ack'    ],
  \ ['GrepperAg',      'ag'     ],
  \ ['GrepperFindstr', 'findstr'],
  \ ['GrepperGit',     'git'    ],
  \ ['GrepperGrep',    'grep'   ],
  \ ['GrepperRg',      'rg'     ],
  \ ['GrepperPt',      'pt'     ],
  \ ]

for [cmd, tool] in cmds
  if exists(":" . cmd)
    execute 'delcommand ' cmd
  endif
endfor

" Run Grepper for `ag`
"
" args - Query args, if blank default is "<cword>"
" gf   - If true, use the quickfix window, if false use locationlist
"
" Returns nothing.
function! s:ag(args, qf)
  let cmd = "Grepper -noprompt -tool ag "

  if !a:qf
    let cmd .= "-noquickfix "
  endif

  let cmd .= "-query "
  let cmd .= empty(a:args) ? expand("<cword>") : a:args

  execute cmd
endfunction

" :Ag <query> - Search for <query>, add results to quickfix
" :Ag         - Search for word under cursor, add results to quickfix
command! -nargs=* -complete=file Ag call s:ag(<q-args>, 1)

" :LAg <query> - Search for <query>, add results to location-list
" :LAg         - Search for word under cursor, add results to location-list
command! -nargs=* -complete=file LAg call s:ag(<q-args>, 0)
