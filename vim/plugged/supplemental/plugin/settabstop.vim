" Sets tabstops. Call with a bang to set noexpandtab
command! -bang -nargs=1 SetTabstop
  \ exe "setlocal" "tabstop=<args>" "shiftwidth=<args>" "softtabstop=<args>"
  \ (<bang>0 ? "noexpandtab" : "expandtab")
