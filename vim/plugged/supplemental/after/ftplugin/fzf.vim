" Allow ^w to delete word in fzf :terminal windows (vim only)
if exists("+termwinkey")
  setlocal termwinkey=<F20>

  let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
    \ "|setlocal termwinkey<"
endif

tunmap <buffer> <c-w>
