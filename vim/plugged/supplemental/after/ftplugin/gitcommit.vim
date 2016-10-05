" Place the cursor at the top of the buffer
autocmd BufWinEnter * exe 'normal! gg'

" Enable spell checking
setlocal spell

" Enable line wrapping
setlocal wrap

" Wrap lines at 'breakat' (FIXME: not sure if I need this?)
setlocal linebreak
