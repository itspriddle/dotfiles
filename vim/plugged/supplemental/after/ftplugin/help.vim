if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Usq q to :quit help buffer
nnoremap <silent> <buffer> q :q<cr>
