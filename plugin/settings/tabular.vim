" tabular.vim

function! s:registerTabularPatterns()
  AddTabularPattern! assignment /^[^=]*\zs=>\?
  AddTabularPattern! colon      /^[^:]*:\zs/l0l1
  AddTabularPattern! comma      /,\zs/l1r0
endfunction

function! s:makeMap(key, pattern)
  execute "nmap <leader>a".a:key." :Tabularize ".a:pattern."<cr>"
  execute "vmap <leader>a".a:key." :Tabularize ".a:pattern."<cr>"
endfunction

autocmd VimEnter * call s:registerTabularPatterns()

call s:makeMap("=", "assignment")
call s:makeMap(":", "colon")
call s:makeMap(",", "comma")
