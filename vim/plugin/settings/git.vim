if has("autocmd")
  " Place the cursor at the top of the buffer
  autocmd VimEnter .git/COMMIT_EDITMSG exe "normal! gg"
endif

command! Gpush exe 'Git push'
