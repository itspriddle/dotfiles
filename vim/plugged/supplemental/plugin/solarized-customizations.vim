augroup solarized_customizations
  autocmd!

  autocmd BufReadPost *
    \ if get(g:, 'colors_name', 'solarized8') =~ '^solarized8\?' |
    \   highlight! ColorColumn term=reverse ctermbg=236 guibg=#002a35 |
    \ endif
augroup END
