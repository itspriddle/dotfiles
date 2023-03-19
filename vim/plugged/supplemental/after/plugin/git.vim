" Git (git.vim and fugitive.vim) {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup ft_git
  autocmd!

  " Hard-tabs on gitconfig files
  autocmd FileType gitconfig setl noexpandtab

  " Replace GitHub issue/pull/commit URLS with Markdown shorthand syntax
  "
  " Eg:
  "   https://github.com/itspriddle/vim-config/issues/1 becomes
  "   itspriddle/vim-config#1
  "
  "   https://github.com/itspriddle/vim-config/pull/1 becomes
  "   itspriddle/vim-config#1
  "
  "   https://github.com/itspriddle/vim-config/commit/deadbeef becomes
  "   itspriddle/vim-config@deadbeef
  autocmd BufWritePre *.git/{COMMIT,PULLREQ}_EDITMSG
    \ execute 'keeppatterns %s,\vhttps?://github.com/([^/]+)/([^/]+)/(pull|issues|commit)/(\x+),\=submatch(1)."/".submatch(2).(submatch(3) == "commit" ? "@" : "#").(submatch(3) == "commit" ? submatch(4)[0:7] : submatch(4)),gei'
augroup END
