if has("autocmd")
  "autocmd filetype css,scss set foldmethod=marker foldmarker=@group,@end
  autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true\ --template=low
endif
