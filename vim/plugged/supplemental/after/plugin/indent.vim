" Fix indentation for html files, see http://bit.ly/XnlHJz
" This has to be set in an `after/` rtp, or Vim resets it.
autocmd FileType html,eruby setlocal indentkeys-=*<Return>
