" Only indent once when starting a line with \
let g:vim_indent_cont = 2

setlocal
  \ tabstop=2
  \ shiftwidth=2
  \ softtabstop=2
  \ expandtab

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal tabstop< shiftwidth< softtabstop< expandtab<"
