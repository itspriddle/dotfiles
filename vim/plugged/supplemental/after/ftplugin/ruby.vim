let g:ruby_space_errors = 1
let g:ruby_operators    = 1

" Lookup docs in Dash.app on OS X
nmap <buffer> K <Plug>DashSearch

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

" Run Dispatch for the current file
map <leader>d :TestFile<cr>

" Run Dispatch for the current line
map <leader>D :TestNearest<cr>

" Stop highlighting after 200 columns, recent vim-ruby is slow on long lines
setlocal synmaxcol=200
