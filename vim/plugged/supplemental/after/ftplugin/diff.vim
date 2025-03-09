" Don't wrap lines on diffs
setlocal textwidth=0

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal textwidth<"
