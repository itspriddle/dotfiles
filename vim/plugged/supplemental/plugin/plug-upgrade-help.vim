if &cp || !exists("g:plugs") || (exists("g:_plug_home") && g:_plug_home)
  finish
else
  let g:_plug_home = 1
endif

" Find plug.txt in runtimepath
let s:plug_help = fnamemodify(findfile('doc/plug.txt', &runtimepath), ':p')

function s:upgrade_help()
  echo "Downloading latest version of vim-plug help"
  redraw

  let l:help = s:esc(s:plug_home . '/doc/plug.txt')
  let l:cmd = 'curl -fLo ' . l:help . ' --create-dirs ' . s:plug_help

  let out = system(l:cmd)

  if v:shell_error
    echo "Error upgrading vim-plug help"
    return 0
  endif

  if readfile(l:help) ==# readfile(s:plug_help)
    echo "vim-plug help is already up-to-date"
    return 0
  else
    call rename(l:help, s:plug_help . ".old")
    call rename(s:plug_help, l:help)
    execute 'helptags' fnameescape(s:plug_home . '/doc')
    echo "vim-plug help has been upgraded"
  endif
endfunction

"command! -nargs=0 -bar PlugUpgradeHelp call s:upgrade_help()
