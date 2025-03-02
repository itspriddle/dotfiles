" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:editor_config_disabled_loaded") && g:editor_config_disabled_loaded
  finish
else
  let g:editor_config_disabled_loaded = 1
endif

" Disable EditorConfig by filetype
augroup editor_config_disables
  autocmd!

  autocmd FileType sh let b:EditorConfig_disable = 1
augroup END
