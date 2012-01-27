" tabular.vim

function! s:registerTabularPatterns()
  AddTabularPattern! assignment  /^[^=]*\zs=>\?/
  AddTabularPattern! first_colon /^[^:]*:\zs/l0l1
  AddTabularPattern! first_comma /^[^,]*\zs,/l1r0
endfunction

function! s:makeMap(key, pattern)
  for m in ['n', 'v']
    execute m."map <leader>a".a:key." :Tabularize ".a:pattern."<cr>"
  endfor
endfunction

augroup tabular
  autocmd!
  autocmd VimEnter * call s:registerTabularPatterns()
augroup END

call s:makeMap("=",       "assignment")
call s:makeMap(":",       "first_colon")
call s:makeMap(",",       "first_comma")
call s:makeMap("<space>", "multiple_spaces")
