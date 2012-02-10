" Buffers

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" Preserve folds and other view settings across sessions
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Remember last location in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
