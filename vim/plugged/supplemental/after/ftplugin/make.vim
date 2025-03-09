" Make requires hard-tabs to be used. Display them and use 4 space tabs
" instead of the default of 2 defined in vimrc
setlocal list tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal list< tabstop< shiftwidth< softtabstop< noexpandtab<"
