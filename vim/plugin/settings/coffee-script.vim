augroup ft_coffee
  autocmd!

  " Compile the current buffer in a vertical split
  autocmd FileType coffee nmap <buffer> <leader>cc :CoffeeCompile vert<cr>

  " Compile the current selection in a vertical split
  autocmd FileType coffee vmap <buffer> <leader>cc :CoffeeCompile vert<cr>

  " Compile and run the current buffer
  autocmd FileType coffee nmap <buffer> <leader>cr :CoffeeRun<cr>
  autocmd FileType coffee vmap <buffer> <leader>cR :CoffeeRun<cr>

  " Compile the current buffer, output the result to a new file.
  autocmd FileType coffee nmap <buffer> <leader>cm :CoffeeMake<cr>

  " Same as above, Intentionally has no <cr> so an option can be added
  autocmd FileType coffee nmap <buffer> <leader>cM :CoffeeMake
augroup END
