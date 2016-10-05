" Reset lightline when `colorscheme` or `set bg` are called.
"
" Eg:
"   :set bg=dark
"   :colorscheme solarized
"   " Vim colorscheme and Lightline theme is set to solarized dark
"   :set bg=light
"   " Vim colorscheme and Lightline theme is set to solarized light
augroup set_lightline_for_solarized
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") == "solarized" |
    \   runtime autoload/lightline/colorscheme/solarized.vim |
    \ endif |
    \ call lightline#init() |
    \ call lightline#colorscheme() |
    \ call lightline#update()
augroup END
