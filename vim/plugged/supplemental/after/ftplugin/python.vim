" make Python follow PEP8 (http://www.python.org/dev/peps/pep-0008/)
setlocal softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal softtabstop< tabstop< shiftwidth< textwidth<"
