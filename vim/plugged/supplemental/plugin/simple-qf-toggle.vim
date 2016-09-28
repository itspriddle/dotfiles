" simple-qf-toggle.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)
"
" Based on https://github.com/Valloric/ListToggle

if &cp || exists("g:simple_qf_toggle_loaded") && g:simple_qf_toggle_loaded
  finish
else
  let g:simple_qf_toggle_loaded = 1
endif

" Private: Returns the number of buffers visible on the current tabpage.
"
" Returns an Integer.
function! s:buffer_count()
  return tabpagewinnr(tabpagenr(), "$")
endfunction

" Private: Toggles visibility of the Quickfix window.
"
" Returns nothing.
function! s:toggle_quickfix()
  let cnt = s:buffer_count()

  silent! cclose

  if s:buffer_count() == cnt
    silent! botright copen
  endif
endfunction

" Define your own map, eg:
"
"   nmap <leader>q <Plug>(simple-qf-toggle)
nnoremap <silent> <Plug>(simple-qf-toggle) :call <SID>toggle_quickfix()<cr>
