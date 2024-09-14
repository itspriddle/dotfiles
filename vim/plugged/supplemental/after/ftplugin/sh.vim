" Tweak formatting:
"   j - Where it makes sense, remove a comment leader when joining lines.
"   c - Auto-wrap comments using textwidth, inserting the current comment
"       leader automatically.
"   r - Automatically insert the current comment leader after hitting <Enter>
"       in Insert mode.
"   o - Automatically insert the current comment leader after hitting 'o' or
"       'O' in Normal mode.
"   q - Allow formatting of comments with "gq".
"   l - Long lines are not broken in insert mode.
setlocal formatoptions=jcroql

" Run shellcheck and open quickfix list
map <leader>d :ShellCheck!<cr>
map <leader>l :LShellCheck!<cr>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal formatoptions< |unmap <leader>d"
