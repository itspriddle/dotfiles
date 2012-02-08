augroup ft_css
  autocmd!

  " Fold on @group/@end like CSSEdit
  autocmd FileType css,scss setl foldmethod=manual foldmarker=@group,@end

  " Format CSS, requires csstidy to be in $PATH
  autocmd FileType css setl equalprg=csstidy\ -\ --silent=true\ --template=low\ \|\ expand\ -t2
augroup END
