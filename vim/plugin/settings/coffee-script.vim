function! s:makeMaps()
  nmap <buffer> <leader>cc :CoffeeCompile vert<cr>
  vmap <buffer> <leader>cc :CoffeeCompile vert<cr>
  nmap <buffer> <leader>cr :CoffeeRun<cr>
  nmap <buffer> <leader>cm :CoffeeMake<cr>

  " Intentionally has no <cr> so an option can be added
  nmap <buffer> <leader>cM :CoffeeMake
endfunction

augroup coffeemaps
  autocmd!
  autocmd FileType coffee call s:makeMaps()
augroup END
