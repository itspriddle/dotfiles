" simplegist.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:simplegist_loaded") && g:simplegist_loaded
  finish
else
  let g:simplegist_loaded = 1
endif


" :<','>Gist [args] (requires gist in PATH)
command! -nargs=* -range=% Gist
  \ let b:gist_filename = expand('%:t') |
  \ if &bt != 'nofile' && empty(b:gist_filename) && &ft != '' |
  \   let b:gist_args = '-t '.&ft |
  \ elseif &bt != 'nofile' && len(b:gist_filename) |
  \   let b:gist_args = '-f %' |
  \ else |
  \   let b:gist_args = '' |
  \ endif |
  \ exe '<line1>,<line2>w !gist -p -c '.b:gist_args.' <args>' |
  \ unlet b:gist_filename b:gist_args
