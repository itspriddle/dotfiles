" ruby.vim
let g:ruby_space_errors = 1
let g:ruby_operators    = 1

augroup ft_ruby
  autocmd!

  " Open or create the associated file in a horizontal split
  autocmd FileType ruby map <buffer> <leader>s :AS!<cr>

  " Open or create the associated file in a vertical split
  autocmd FileType ruby map <buffer> <leader>v :AV!<cr>
augroup END
