if has("autocmd")
  " Setup wrapping for text files
  autocmd BufRead,BufNewFile *.{txt,md,markdown,mdown,mkd,mkdn} setlocal wrap textwidth=78
endif

" Markded.app view
map <leader>mv :MarkedOpen<cr>

" Marked.app quit
map <leader>mq :MarkedQuit<cr>
