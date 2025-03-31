if exists("did_load_filetypes")
  finish
endif


augroup filetypedetect
  " Enable syntax highlighting for Brewfiles
  autocmd BufNewFile,BufRead {.,}Brewfile setfiletype ruby

  " Enable syntax highlighting for my.cnf files
  autocmd BufNewFile,BufRead {.,}my.cnf setfiletype dosini

  " Enable syntax highlighting for ~/.aws/config
  autocmd BufNewFile,BufRead ~/.aws/config setfiletype dosini

  " YAML highlighting for Rails secrets
  autocmd BufNewFile,BufRead secrets.yml.enc.[0-9]\+ setfiletype yaml

  " Direnv/dotenv
  autocmd BufNewFile,BufRead {.,}envrc,{,.}direnvrc,.env{rc,}.*
    \ let g:is_bash = 1 |
    \ let b:is_bash = 1 |
    \ setfiletype sh |
    \ unlet g:is_bash

  " Match files opened by `gh pr create --editor`
  autocmd BufNewFile,Bufread */[0-9]\+.md
    \ if getline(line('$') - 3) == "------------------------ >8 ------------------------" |
    \  setfiletype pullrequest |
    \ endif
augroup END

