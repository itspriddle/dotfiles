" :PU  - Run PlugUpdate
" :PU! - Run PlugClean and PlugUpdate
command! -bang PU if <bang>0 | :PlugClean | endif | :PlugUpdate
