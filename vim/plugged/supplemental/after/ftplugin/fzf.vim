" Allow ^w to delete word in fzf :terminal windows (vim only)
if exists("+termwinkey")
  setlocal termwinkey=<F20>
endif

tunmap <buffer> <c-w>
