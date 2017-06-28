" Fix color changes in recent (June 2017) vim-ruby/vim-rails that hurt my
" eyes.
"
" See also:
"   - https://github.com/vim-ruby/vim-ruby/commit/074200ffa39b19baf9d9750d399d53d97f21ee07
"   - https://github.com/vim-ruby/vim-ruby/commit/e233f929ee7926f838eb9051b410f5d62f64b6c1
"   - https://github.com/vim-ruby/vim-ruby/commit/35fca9891a738d1903bff2ad15266d49dd415e64
"   - https://github.com/tpope/vim-rails/commit/f666ee0b923c218d01959b3e4cb4d75b5660ea9f
"   - https://github.com/tpope/vim-rails/commit/610834fdac6515356dc2c079ea30ce0bd895d5e8

syn match   rubyInclude "\<include\>[?!]\@!"
syn keyword rubyInclude extend prepend refine using

hi link rubyAccess         Statement
hi link rubyAssertion      Function
hi link rubyAttribute      Statement
hi link rubyBlockParameter Identifier
hi link rubyMacro          Function
hi link rubyResponse       Function
