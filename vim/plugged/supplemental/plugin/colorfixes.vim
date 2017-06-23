augroup josh_color_fixes
  autocmd!

  " Change color on rubyMacro (eg: `attr_accessor` below)
  "
  "   class Foo
  "     attr_accessor :bar
  "   end
  autocmd VimEnter * hi link rubyMacro Function

  " Change color of QuickFixLine to match Search
  autocmd FileType qf hi! link QuickFixLine Search
augroup END
