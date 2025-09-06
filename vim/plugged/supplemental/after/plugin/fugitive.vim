augroup ft_fugitive
  autocmd!
  autocmd FileType fugitive nmap <buffer> czl :G --paginate stash list '--pretty=format:%h %as %<(10)%gd %<(76,trunc)%s'<cr>
augroup END
