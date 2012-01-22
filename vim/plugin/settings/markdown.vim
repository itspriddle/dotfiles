if has("autocmd")
  " Setup wrapping for text files
  autocmd BufRead,BufNewFile *.{txt,md,markdown,mdown,mkd,mkdn} set wrap wrapmargin=2 textwidth=78
endif
