if exists("b:did_ftplugin")
  finish
endif

let b:did_ftplugin = 1

" Disable K (ri lookup)
noremap <buffer> K <nop>

" Open or create the associated file in a horizontal split
noremap <buffer> <leader>s :AS<cr>

" Open or create the associated file in a vertical split
noremap <buffer> <leader>v :AV<cr>

" Setup Dispatch's `:Start` to open the given file in IRB
let b:start = 'irb -r "%:p"'

" Set compiler
if expand('%') =~# '_spec\.rb$'
  let b:dispatch = 'rspec %'
  compiler rspec
endif
