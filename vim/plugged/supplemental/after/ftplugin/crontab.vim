" Don't wrap long lines, setup comments
setlocal textwidth=0 comments=:# commentstring=#\ %s

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal textwidth< comments< commentstring<"
