" Quickfix windows

function! s:cmd(cmd) abort
  let info = get(getwininfo(win_getid()), 0, {})
  let is_qf = has_key(info, "quickfix") && info.quickfix
  let is_ll = has_key(info, "loclist")  && info.loclist

  if is_qf && is_ll
    return "l" . a:cmd
  elseif is_qf
    return "c" . a:cmd
  endif
endfunction

augroup ft_quickfix
  autocmd!

  " q to close the quickfix/location list windows
  autocmd FileType qf nnoremap <silent> <buffer> q :q<cr>

  " - in a quickfix/location list window for :colder/:lolder
  autocmd FileType qf nnoremap <silent> <buffer> - :<C-U>exe <SID>cmd("older")<cr>

  " + in a quickfix/location list window for :cnewer/:lnewer
  autocmd FileType qf nnoremap <silent> <buffer> + :<C-U>exe <SID>cmd("newer")<cr>

  " Cleanup quickfix windows so they're not so ugly
  autocmd BufNewFile,BufRead *
    \ if &bt =~# '^\%(quickfix\|nofile\)$' |
    \   setlocal colorcolumn=0 nolist nobuflisted nocursorline nowrap foldcolumn=0 |
    \ endif
augroup END
