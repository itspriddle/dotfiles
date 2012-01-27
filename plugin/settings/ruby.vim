" ruby.vim
let g:ruby_space_errors = 1
let g:ruby_operators    = 1

function! s:makeMaps()
  " Open the associated file in a horizontal split
  map <buffer> <leader>s :AS<cr>

  " Open the associated file in a vertical split
  map <buffer> <leader>v :AV<cr>
endfunction

augroup rubymaps
  autocmd!
  autocmd Filetype ruby call s:makeMaps()
augroup END
