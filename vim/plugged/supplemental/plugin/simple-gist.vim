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
  \ if &bt != 'nofile' && len(b:gist_filename) |
  \   let b:gist_args = '-f '.b:gist_filename |
  \ else |
  \   let b:gist_args = '' |
  \ endif |
  \ exe '<line1>,<line2>w !gh gist create '.b:gist_args.' <args> 2> /dev/null' |
  \ unlet b:gist_filename b:gist_args
