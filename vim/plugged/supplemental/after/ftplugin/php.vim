" Use // for comments with vim-commentary
setlocal commentstring=//\ %s

" Show invisibles since PHP code often uses hard tabs
setlocal list

" Use soft-tabs with 4 spaces
setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal commentstring< list< tabstop< shiftwidth< softtabstop< expandtab<"
