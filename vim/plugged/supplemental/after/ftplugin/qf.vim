" Private: Jump to the previous/next QF or LL list using `:colder` and friends
"
" cmd - "older" or "newer"
"
" Returns a String.
function! s:jump(cmd) abort
  let l:info  = get(getwininfo(win_getid()), 0, {})
  let l:is_qf = has_key(l:info, "quickfix") && l:info.quickfix
  let l:is_ll = has_key(l:info, "loclist")  && l:info.loclist

  if l:is_qf && l:is_ll
    return "l" . a:cmd
  elseif l:is_qf
    return "c" . a:cmd
  endif
endfunction

" q to close the quickfix/location list windows
nnoremap <silent> <buffer> q :q<cr>

" - in a quickfix/location list window for :colder/:lolder
nnoremap <silent> <buffer> - :<C-U>exe <SID>jump("older")<cr>

" + in a quickfix/location list window for :cnewer/:lnewer
nnoremap <silent> <buffer> + :<C-U>exe <SID>jump("newer")<cr>

" Cleanup quickfix/location list windows so they're not so ugly
setlocal colorcolumn=0 nolist nobuflisted nocursorline nowrap foldcolumn=0
