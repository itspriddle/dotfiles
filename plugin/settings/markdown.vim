if has("autocmd")
  " Setup wrapping for text files
  autocmd BufRead,BufNewFile *.{txt,md,markdown,mdown,mkd,mkdn} setlocal wrap textwidth=78
endif
