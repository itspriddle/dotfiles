augroup solarized_customizations
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") == "solarized" |
    \   highlight! VertSplit ctermbg=0 ctermfg=0 |
    \ endif
augroup END
