" Quickfix windows

function s:run_cmd()
  let info = get(getwininfo(win_getid()), 0, {})
  let is_qf = has_key(info, "quickfix") && info.quickfix
  let is_ll = has_key(info, "loclist")  && info.loclist

  if is_qf && is_ll
    execute "l" . a:cmd
  elseif is_qf
    execute "c" . a:cmd
  endif
endfunction

augroup ft_quickfix
  autocmd!

  " Quickfix windows always on bottom, full window width
  autocmd FileType qf wincmd J | resize 10 | nnoremap <silent> <buffer> q :q<cr>

  " - in a quickfix/location list window for :colder/:lolder
  autocmd FileType qf nnoremap <silent> <buffer> - :<C-U>exe <SID>run_cmd("older")<cr>

  " + in a quickfix/location list window for :cnewer/:lnewer
  autocmd FileType qf nnoremap <silent> <buffer> + :<C-U>exe <SID>run_cmd("newer")<cr>

  " Cleanup quickfix windows so they're not so ugly
  autocmd BufNewFile,BufRead *
    \ if &bt =~# '^\%(quickfix\|nofile\)$' |
    \   setlocal colorcolumn=0 nolist nobuflisted nocursorline nowrap foldcolumn=0 |
    \ endif
augroup END
