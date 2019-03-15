if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Enable syntax highlighting for Brewfiles
  autocmd BufNewFile,BufRead Brewfile,.Brewfile setfiletype ruby

  " Enable syntax highlighting for my.cnf files
  autocmd BufNewFile,BufRead my.cnf,.my.cnf setfiletype dosini

  " Enable syntax highlighting for tmux config files
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setfiletype tmux

  " Enable syntax highlighting for ~/.aws/config
  autocmd BufNewFile,BufRead ~/.aws/config setfiletype dosini

  " YAML highlighting for Rails secrets
  autocmd BufNewFile,BufRead secrets.yml.enc.[0-9]\+ setfiletype yaml

  " Direnv
  autocmd BufNewFile,BufRead .envrc,envrc,.direnvrc,direnvrc
    \ let g:is_bash = 1 |
    \ setfiletype sh |
    \ unlet g:is_bash
augroup END
