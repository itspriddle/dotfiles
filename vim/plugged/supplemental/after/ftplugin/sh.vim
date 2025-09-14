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
noremap <buffer> <leader>l :ShellCheck!<cr>
noremap <buffer> <leader>L :LShellCheck!<cr>
noremap <buffer> m<cr> :ShellCheck!<cr>

" Disable EditorConfig for shell scripts
let b:EditorConfig_disable = 1

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal formatoptions< " .
  \ "|execute 'unmap <buffer> <leader>d'" .
  \ "|execute 'unmap <buffer> <leader>l'"
