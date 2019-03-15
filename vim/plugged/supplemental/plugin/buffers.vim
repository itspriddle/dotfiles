" Buffers (performed on every buffer)

augroup all_buffers
  autocmd!

  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<c-w>="

  " Remember last location in file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") && &ft !~# "commit" |
    \   exe "normal! g'\"" |
    \ endif
augroup END
