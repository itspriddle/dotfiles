" simpletab.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

" Based on http://git.io/IOKE-g
if &cp || exists("g:simpletab_loaded") && g:simpletab_loaded
  finish
endif

let g:simpletab_loaded = 1

function! s:SimpleTab()
  let l:col = col('.') - 1

  if !l:col || getline('.')[l:col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
  endif
endfunction

inoremap <Tab> <c-r>=<SID>SimpleTab()<cr>
inoremap <S-Tab> <c-n>
