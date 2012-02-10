augroup ft_css
  autocmd!

  " Fold on @group/@end like CSSEdit
  autocmd FileType css,scss setl foldmethod=manual foldmarker=@group,@end

  " Format CSS, requires csstidy to be in $PATH
  autocmd FileType css let &l:equalprg='csstidy - --silent=true --template=$HOME/.vim/share/support/csstidy.tpl | sed -E "s/,([^ ])/, \1/g"'
augroup END
