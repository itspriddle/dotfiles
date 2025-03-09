" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Check syntax
nnoremap <buffer> <leader>l :!php -l %<cr>

" Go to definition
" nmap <buffer> gf <Plug>(composer-find)
nnoremap <buffer> gf :<C-u>execute composer#autoload#find()<CR>
nnoremap <buffer> <C-]> :<C-u>execute composer#autoload#find()<CR>

" Insert use statement
nnoremap <buffer> gF <Plug>(composer-use)

" Open or create the associated file in a horizontal split
nnoremap <buffer> <leader>s :AS<cr>

" Open or create the associated file in a vertical split
nnoremap <buffer> <leader>v :AV<cr>

function! s:Pint(args, bang) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  if a:bang
    execute "Dispatch pint --format=txt --verbose" l:args
  else
    execute "Dispatch pint --test --format=txt --verbose" l:args
  endif
endfunction
command! -buffer -bang -complete=file -nargs=* Pint call s:Pint(<q-args>, <bang>0)

function! s:PHPStan(args) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  execute "Dispatch phpstan analyze --no-progress" l:args
endfunction
command! -buffer -complete=file -nargs=* PHPStan call s:PHPStan(<q-args>)

function! s:Pest(args) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  execute "Dispatch pest" l:args
endfunction
command! -buffer -complete=file -nargs=* Pest call s:Pest(<q-args>)

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal commentstring< list< tabstop< shiftwidth< softtabstop< expandtab<" .
  \ "|execute 'unmap <buffer> <leader>l'" .
  \ "|execute 'unmap <buffer> gf'" .
  \ "|execute 'unmap <buffer> <C-]>'" .
  \ "|execute 'unmap <buffer> gF'" .
  \ "|execute 'unmap <buffer> <leader>s'" .
  \ "|execute 'unmap <buffer> <leader>v'" .
  \ "|delcommand Pint" .
  \ "|delcommand PHPStan" .
  \ "|delcommand Pest"
