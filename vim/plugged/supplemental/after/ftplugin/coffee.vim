" Compile the current buffer in a vertical split
nnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>

" Compile the current selection in a vertical split
vnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>

" Compile and run the current buffer
nnoremap <buffer> <leader>cr :CoffeeRun<cr>
vnoremap <buffer> <leader>cr :CoffeeRun<cr>

" Compile the current buffer, output the result to a new file.
nnoremap <buffer> <leader>cm :CoffeeMake<cr>

" Same as above, Intentionally has no <cr> so an option can be added
nnoremap <buffer> <leader>cM :CoffeeMake
