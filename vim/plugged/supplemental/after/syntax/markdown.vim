" Allows highlighting fenced code examples with tpope/vim-liquid and
" tpope/vim-markdown. Not sure yet if it breaks anything else :)
for s:type in g:markdown_fenced_languages
  exe 'syn region markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=markdownCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
endfor
unlet! s:type
