augroup ft_git
  autocmd!

  " Place the cursor at the top of the buffer
  autocmd VimEnter .git/COMMIT_EDITMSG exe "normal! gg"
augroup END

" Alias Gpush
command! Gpush exe 'Git push'

" Show git status for the repo
map <leader>gs :Gstatus<cr>

" Write the current buffer to git index
map <leader>gw :Gwrite<cr>

" Commit current git index
map <leader>gc :Gcommit -m ""<left>

" Push current branch upstream
map <leader>gp :Gpush<cr>
