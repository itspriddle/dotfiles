" simpletab.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

" Based on http://git.io/IOKE-g
if &cp || exists("g:simpletab_loaded") && g:simpletab_loaded
  finish
else
  let g:simpletab_loaded = 1
endif

function! s:SimpleTab(completion, trigger)
  if !pumvisible() && getline('.')[col('.') - 2] !~ '\k'
    return a:trigger
  else
    return a:completion
  endif
endfunction

inoremap <expr> <tab>   <SID>SimpleTab("\<c-n>", "\<tab>")
inoremap <expr> <s-tab> <SID>SimpleTab("\<c-p>", "\<s-tab>")
