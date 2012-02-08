augroup ft_markdown
  autocmd!

  " Setup wrapping for text files
  autocmd BufRead,BufNewFile *.{txt,md,markdown,mdown,mkd,mkdn} setl wrap textwidth=78
augroup END

" Markded.app view
map <leader>mv :MarkedOpen<cr>

" Marked.app quit
map <leader>mq :MarkedQuit<cr>
