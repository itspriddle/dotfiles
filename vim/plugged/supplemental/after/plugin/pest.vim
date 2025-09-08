augroup pest
  autocmd!
  " *Test.php files
  autocmd BufRead,BufNewFile *Test.php setlocal errorformat=%f:%l:%c:%m
augroup END
