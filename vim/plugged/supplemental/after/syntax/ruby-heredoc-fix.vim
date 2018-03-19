" Fix heredoc syntax
let s:foldable_groups = split(
      \	  get(
      \	    b:,
      \	    'ruby_foldable_groups',
      \	    get(g:, 'ruby_foldable_groups', 'ALL')
      \	  )
      \	)

function! s:foldable(...) abort
  if index(s:foldable_groups, 'ALL') > -1
    return 1
  endif

  for l:i in a:000
    if index(s:foldable_groups, l:i) > -1
      return 1
    endif
  endfor

  return 0
endfunction " }}}

" Here Document {{{1
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<[-~]\=\zs\%(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)+	 end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<[-~]\=\zs"\%([^"]*\)"+ end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<[-~]\=\zs'\%([^']*\)'+ end=+$+ oneline contains=ALLBUT,@rubyNotTop
syn region rubyHeredocStart matchgroup=rubyStringDelimiter start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<[-~]\=\zs`\%([^`]*\)`+ end=+$+ oneline contains=ALLBUT,@rubyNotTop

if s:foldable('<<')
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<"\z([^"]*\)"\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<'\z([^']*\)'\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc		    fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<`\z([^`]*\)`\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial fold keepend

  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3    matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]"\z([^"]*\)"\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]'\z([^']*\)'\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart		    fold keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]`\z([^`]*\)`\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial fold keepend
else
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<"\z([^"]*\)"\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<'\z([^']*\)'\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc		    keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]})"'.]\)\s\|\w\)\@<!<<`\z([^`]*\)`\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+2	matchgroup=rubyStringDelimiter end=+^\z1$+ contains=rubyHeredocStart,rubyHeredoc,@rubyStringSpecial keepend

  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]\z(\%(\h\|[^\x00-\x7F]\)\%(\w\|[^\x00-\x7F]\)*\)\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3    matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]"\z([^"]*\)"\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]'\z([^']*\)'\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart		    keepend
  syn region rubyString start=+\%(\%(class\|::\)\_s*\|\%([]}).]\)\s\|\w\)\@<!<<[-~]`\z([^`]*\)`\ze\%(.*<<[-~]\=['`"]\=\h\)\@!+hs=s+3  matchgroup=rubyStringDelimiter end=+^\s*\zs\z1$+ contains=rubyHeredocStart,@rubyStringSpecial keepend
endif
