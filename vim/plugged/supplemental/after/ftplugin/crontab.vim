if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Don't wrap long lines, setup comments
setlocal textwidth=0 comments=:# commentstring=#\ %s
