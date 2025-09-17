augroup solarized_customizations
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") =~ '^solarized8\?' |
    \   highlight! link VertSplit ColorColumn |
    \ endif
augroup END
