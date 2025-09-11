function! s:run(open, qf, args) abort
  let old_errorformat = &errorformat
  let files = empty(a:args) ? expand('%:S') : join(a:args)
  let cmd = 'composer exec -- phpstan analyse --no-progress --error-format=raw ' . files
  let &errorformat = '%f:%l:%m,%-G%.%#'

  try
    execute "silent" (a:qf ? "cgetexpr" : "lgetexpr") "system(cmd)"

    let errors = a:qf ? getqflist() : getloclist(0)
    let error_count = len(errors)
    let title = printf("PHPStan results: %d ".(error_count == 1 ? "error" : "errors"), error_count)

    if a:qf
      call setqflist([], "r", { "title": title })
    else
      call setloclist(0, [], "r", { "title": title })
    endif

    if error_count > 0
      if a:open
        execute a:qf ?
          \ get(g:, "phpstan_qf_open", "botright copen 10") :
          \ get(g:, "phpstan_ll_open", "lopen 10")
      endif
    else
      execute (a:qf ? "cclose" : "lclose")
    endif

    redraw!

    echo title
  finally
    let &errorformat = old_errorformat
  endtry
endfunction

command! -buffer -bang -complete=file -nargs=* PHPStan call s:run(<bang>1, 1, <q-args>)
command! -buffer -bang -complete=file -nargs=* LPHPStan call s:run(<bang>1, 0, <q-args>)

if !get(g:, "phpstan_no_mappings", 0) && !hasmapto('b', '<leader>P')
  nnoremap <buffer> <leader>P :PHPStan<CR>

  let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
    \ "|execute 'unmap <buffer> <leader>P'"
endif

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|delcommand PHPStan"
  \ "|delcommand LPHPStan"
