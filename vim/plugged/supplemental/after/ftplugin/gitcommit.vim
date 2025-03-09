" Place the cursor at the top of the buffer
autocmd FileType gitcommit exe "normal! gg"

" Enable spell checking
setlocal spell

" Enable line wrapping
setlocal wrap

" Wrap lines at 'breakat' (FIXME: not sure if I need this?)
setlocal linebreak

" Unlimited line length for PR messages
autocmd BufEnter *.git/PULLREQ_EDITMSG
  \ if expand("%") =~# ".*\.git\/PULLREQ_EDITMSG" |
  \   setlocal textwidth=0 wrap |
  \   let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \     "|setlocal textwidth< wrap<" |
  \ endif

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|setlocal spell! wrap! linebreak! textwidth<"
