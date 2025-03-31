setlocal textwidth=0 wrap

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal textwidth< wrap<"
