" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" Check syntax
nnoremap <buffer> <leader>l :!php -l %<cr>

function! s:ComposerFind() abort
  let class = composer#autoload#find()

  if empty(class)
    return
  endif

  return split(class, ' ')[1]
endfunction

" Go to file for item under cursor
nnoremap <silent> <buffer> gf :<C-u>execute composer#autoload#find()<CR>

" And since I keep trying to use tags...
nnoremap <silent> <buffer> <C-]> :<C-u>execute composer#autoload#find()<CR>

" Like gf, but in a new split
nnoremap <silent> <buffer> <C-W><C-F> :<C-u>let b:composer_class = <SID>ComposerFind()<bar>if !empty(b:composer_class) <bar> execute 'split' b:composer_class <bar> endif <bar>unlet! b:composer_class<CR>

" Like gf, but in a new tab
nnoremap <silent> <buffer> <C-W>gf :<C-u>let b:composer_class = <SID>ComposerFind()<bar>if !empty(b:composer_class) <bar> execute 'tabnew' b:composer_class <bar> endif <bar>unlet! b:composer_class<CR>

" Like gf, but in a new vertical split
nnoremap <silent> <buffer> <C-W>gF :<C-u>let b:composer_class = <SID>ComposerFind()<bar>if !empty(b:composer_class) <bar> execute 'vsplit' b:composer_class <bar> endif <bar>unlet! b:composer_class<CR>

function! s:composerNamespaceUse() abort
  normal! mz
  execute composer#namespace#use(0)
  normal! `z
endfunction

" " Insert use statement
nnoremap <buffer> gF :<C-u>call <SID>composerNamespaceUse()<CR>

" Open or create the associated file in a horizontal split
nnoremap <buffer> <leader>s :AS<cr>

" Open or create the associated file in a vertical split
nnoremap <buffer> <leader>v :AV<cr>

function! s:Pint(args, bang) abort
  let l:args = (empty(a:args) ? expand("%") : a:args)

  if a:bang
    execute "Dispatch! pint --format=txt --verbose" l:args
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

nnoremap <buffer> <leader>p :Pint!<cr>

nnoremap <buffer> <leader>P :PHPStan<cr>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal commentstring< list< tabstop< shiftwidth< softtabstop< expandtab<" .
  \ "|execute 'unmap <buffer> <leader>l'" .
  \ "|execute 'unmap <buffer> gf'" .
  \ "|execute 'unmap <buffer> <C-]>'" .
  \ "|execute 'unmap <buffer> <C-W><C-F>'" .
  \ "|execute 'unmap <buffer> <C-W>gf'" .
  \ "|execute 'unmap <buffer> <C-W>gF'" .
  \ "|execute 'unmap <buffer> gF'" .
  \ "|execute 'unmap <buffer> <leader>s'" .
  \ "|execute 'unmap <buffer> <leader>v'" .
  \ "|execute 'unmap <buffer> <leader>p'" .
  \ "|execute 'unmap <buffer> <leader>P'" .
  \ "|delcommand Pint" .
  \ "|delcommand PHPStan" .
  \ "|delcommand Pest"
