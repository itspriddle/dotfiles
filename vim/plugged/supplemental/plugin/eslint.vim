function! s:RunCompiler(program) abort
  let old_compiler = get(b:, 'current_compiler', '')
  let old_makeprg = &l:makeprg
  let old_errorformat = &l:errorformat

  try
    silent! execute 'compiler' a:program
    silent! execute 'make' '%'

    " if qf list has anything in it, open it
    if len(getqflist()) > 0
      " only open if it's not already open
      if empty(filter(range(1, winnr('$')), 'getwinvar(v:val, "&buftype") ==# "quickfix"'))
        silent! execute 'botright copen'
      endif
    else
      silent! execute 'cclose'
    end

    redraw!
  finally
    let b:current_compiler = old_compiler
    let &l:makeprg = old_makeprg
    let &l:errorformat = old_errorformat
  endtry
endfunction

augroup eslint_buffers
  autocmd!
  autocmd BufRead,BufNewFile *.vue,*.ts nnoremap <buffer> <leader>l :<C-u>call <SID>RunCompiler('eslint')<CR>
augroup END
