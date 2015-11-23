" Prevents . from triggering a reindent in insert mode UNLESS it is the first
" non-space character.
"
" Consider the following Ruby code:
"
"   build(:foobar, :baz,
"     name:     "Josh",
"     username: "joshpriddle"
"   )
"
" With `indentkeys+=.`, change the username to "josh.priddle". When pressing .
" a reindent is triggered:
"
"   build(:foobar, :baz,
"         username: "josh.priddle"
"     name:     "Josh",
"   )
"
" With `indentkeys-=.`, pressing . while changing the username does NOT
" trigger a reindent:
"
"   build(:foobar, :baz,
"     username: "josh.priddle"
"     name:     "Josh",
"   )

setlocal indentkeys-=. indentkeys+=0.
