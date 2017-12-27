if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Enable syntax highlighting for Brewfiles
  autocmd BufNewFile,BufRead Brewfile,.Brewfile setfiletype ruby

  " Enable syntax highlighting for GitHub Pull Request messages (via `hub`)
  autocmd BufNewFile,BufRead *.git/PULLREQ_EDITMSG setfiletype gitcommit

  " Enable syntax highlighting for my.cnf files
  autocmd BufNewFile,BufRead my.cnf,.my.cnf setfiletype dosini

  " Enable syntax highlighting for tmux config files
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux

  " Enable syntax highlighting for ~/.aws/config
  autocmd BufNewFile,BufRead ~/.aws/config setfiletype dosini
augroup END
