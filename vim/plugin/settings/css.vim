if has("autocmd")
  autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true\ --template=low\ \|\ expand\ -t2
endif
