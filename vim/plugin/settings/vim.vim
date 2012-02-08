augroup ft_vim
  autocmd!

  " Use K to search :help for the word under the cursor
  autocmd FileType vim setl kp=:help

  " Setup spacing
  autocmd FileType vim setl tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END
