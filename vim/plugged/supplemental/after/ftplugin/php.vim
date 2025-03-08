" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Check syntax
nnoremap <leader>l :!php -l %<cr>

" Go to definition
nmap <buffer> gf <Plug>(composer-find)

" Insert use statement
nmap <buffer> gF <Plug>(composer-use)

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
command! -bang -complete=file -nargs=* Pint call s:Pint(<q-args>, <bang>0)

function! s:PHPStan(args) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  execute "Dispatch phpstan analyze --no-progress" l:args
endfunction
command! -complete=file -nargs=* PHPStan call s:PHPStan(<q-args>)

function! s:Pest(args) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  execute "Dispatch pest" l:args
endfunction
command! -complete=file -nargs=* Pest call s:Pest(<q-args>)
