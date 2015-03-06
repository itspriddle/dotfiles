if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Marked.app view
noremap <buffer> <leader>mv :MarkedOpen<cr>

" Marked.app quit
noremap <buffer> <leader>mq :MarkedQuit<cr>

" Show spelling errors
setlocal spell
