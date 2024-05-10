let g:ruby_space_errors = 1
let g:ruby_operators    = 1

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

" Stop highlighting after 200 columns, recent vim-ruby is slow on long lines
" setlocal synmaxcol=400

" regexpengine=1 is faster in my experience. It broke under vim-ruby a while
" back but seems to work again. Addint it here so I remember, but leaving it
" disabled for now so I can see how recent upstream performance improvements
" work out.
" set regexpengine=1

" Check syntax
nnoremap <leader>l :!ruby -c %<cr>
