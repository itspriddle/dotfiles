let s:errorformat='%E<b>%.%#Parse\ error</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,' .
  \ '%W<b>%.%#Notice</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,' .
  \ '%E%.%#Parse\ error:\ %m\ in\ %f\ on\ line\ %l,' .
  \ '%W%.%#Notice:\ %m\ in\ %f\ on\ line\ %l,' .
  \ '%-G%.%#'

function! s:Lint(qf, args) abort
  let old_compiler = get(b:, 'current_compiler', '')
  let old_errorformat = &errorformat
  let files = empty(a:args) ? expand('%:S') : join(a:args)
  let cmd = 'php -lq ' . files
  let &errorformat = s:errorformat

  try
    execute "silent" (a:qf ? "cgetexpr" : "lgetexpr") "system(cmd)"

    let errors = a:qf ? getqflist() : getloclist(0)
    let error_count = len(errors)
    let title = printf("PHP syntax errors: %d ".(error_count == 1 ? "error" : "errors"), error_count)

    if a:qf
      call setqflist([], "r", { "title": title })
    else
      call setloclist(0, [], "r", { "title": title })
    endif

    if error_count > 0
      execute a:qf ?
        \ get(g:, "phplint_qf_open", "botright copen 10") :
        \ get(g:, "phplint_ll_open", "lopen 10")
    else
      execute (a:qf ? "cclose" : "lclose")
    endif

    redraw!
  finally
    let &errorformat = old_errorformat
  endtry
endfunction

command! -buffer -complete=file -nargs=* PHPLint call s:Lint(1, <q-args>)

nnoremap <buffer> <leader>l :PHPLint<CR>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|execute 'unmap <buffer> <leader>l'" .
  \ "|delcommand PHPLint"
