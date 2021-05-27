" Detect tpope/vim-markdown vs plasticboy/vim-markdown
if exists('g:markdown_fenced_languages')

  " syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart
  syn region markdownCodeInline matchgroup=markdownCodeDelimiter start="`" end="`" keepend contains=markdownLineStart
  syn region markdownCode matchgroup=markdownCodeDelimiter start="`` \=" end=" \=``" keepend contains=markdownLineStart
  syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*\z(`\{3,\}\).*$" end="^\s*\z1\ze\s*$" keepend
  syn region markdownCode matchgroup=markdownCodeDelimiter start="^\s*\z(\~\{3,\}\).*$" end="^\s*\z1\ze\s*$" keepend

  hi def link markdownCodeInline Type

  " Allows highlighting fenced code examples with tpope/vim-liquid and
  " tpope/vim-markdown. Not sure yet if it breaks anything else :)
  for s:type in get(g:, 'markdown_fenced_languages', [])
    exe 'syn region markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\..*','','').' matchgroup=markdownCodeDelimiter start="^\s*```\s*'.matchstr(s:type,'[^=]*').'\>.*$" end="^\s*```\ze\s*$" keepend contains=@markdownHighlight'.substitute(matchstr(s:type,'[^=]*$'),'\.','','g')
  endfor
  unlet! s:type
endif
