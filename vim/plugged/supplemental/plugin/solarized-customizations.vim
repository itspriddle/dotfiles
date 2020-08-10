augroup solarized_customizations
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") =~ '^solarized8\?' |
    \   if &background == "light" |
    \     highlight! VertSplit ctermbg=7 ctermfg=7 |
    \   else |
    \     highlight! VertSplit ctermbg=0 ctermfg=0 |
    \   endif |
    \   highlight Terminal ctermbg=none |
    \ endif
augroup END
