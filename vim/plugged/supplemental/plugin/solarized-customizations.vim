augroup solarized_customizations
  autocmd!

  autocmd ColorScheme *
    \ if expand("<amatch>") =~ '^solarized8\?' |
    \   highlight! link VertSplit ColorColumn |
    \   highlight Terminal ctermbg=none |
    \ endif
augroup END

function! s:set_colors(num)
  if a:num == 16
    set t_Co=16
    set background=dark
  elseif a:num == 256
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
    set t_Co=256
    set background=dark
  end
endfunction

command! -nargs=1 SetSolarizedColors call s:set_colors(<f-args>)
