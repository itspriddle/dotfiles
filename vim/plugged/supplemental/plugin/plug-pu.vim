" :PU  - Reload plugin setup and run PlugUpdate
" :PU! - Reload plugin setup, run PlugClean and PlugUpdate
command! -bang PU
  \ source ~/.vim/plug-setup.vim |
  \ if <bang>0 |
  \   :PlugClean |
  \ endif |
  \ :PlugUpdate
