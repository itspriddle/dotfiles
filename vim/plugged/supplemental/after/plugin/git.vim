" Git (git.vim and fugitive.vim) {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup ft_git
  autocmd!

  " Hard-tabs on gitconfig files
  autocmd FileType gitconfig setl noexpandtab

  " Alias Gco
  autocmd User Fugitive command! -buffer -nargs=* Gco exe 'Git checkout <args>'

  " Alias Gpush
  autocmd User Fugitive command! -buffer -nargs=* Gpush exe 'Git push <args>'

  " :Gfixup => :Gcommit -m 'fixup'
  autocmd User Fugitive command! -buffer Gfixup exe 'Gcommit -m "fixup"'

  autocmd VimEnter .git/PULLREQ_EDITMSG
    \ setl wrap filetype=gitcommit textwidth=0 linebreak spell

  autocmd BufReadPost .git/PULLREQ_EDITMSG
    \ execute "normal! gg"

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
  autocmd BufWritePre .git/{COMMIT,PULLREQ}_EDITMSG
    \ execute 'keeppatterns %s,\vhttps?://github.com/([^/]+)/([^/]+)/(pull|issues|commit)/(\x+),\=submatch(1)."/".submatch(2).(submatch(3) == "commit" ? "@" : "#").(submatch(3) == "commit" ? submatch(4)[0:7] : submatch(4)),gei'

  " Replace public Dropbox URLs with download URLs when used for Markdown
  " images.
  " Eg: ![My cat is great](https://www.dropbox.com/s/123/MyCat.jpg) becomes
  "     ![My cat is great](https://dl.dropboxusercontent.com/s/123/MyCat.jpg)
  autocmd BufWritePre .git/PULLREQ_EDITMSG
    \ execute 'keeppatterns %s,\v!\[(.*)\]\(https://www.dropbox.com,![\1](https://dl.dropboxusercontent.com,gei'
augroup END
