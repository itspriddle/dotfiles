function! s:plug_list(A, L, P)
  return filter(keys(g:plugs), 'v:val =~ a:A')
endfunction

function! s:plug_home(name)
  if empty(a:name)
    silent exe '!open https://github.com/junegunn/vim-plug'
    redraw!
  elseif has_key(g:plugs, a:name)
    let plug = g:plugs[a:name]
    if has_key(plug, 'uri') && plug['uri'] =~ 'github'
      let uri = plug['uri']
      let uri = substitute(uri, '\v\C.git$', '', '')
      let uri = substitute(uri, '\v\Cgit::\@github\.com', 'github.com', '')
      let uri = substitute(uri, '\v\Cgit\@github\.com:', 'https://github.com/', '')
      let v:errmsg = uri
      silent exe '!open' uri
      redraw!
    endif
  else
    echomsg 'Unknown plugin '.a:name
  endif
endfunction

" :PlugHome [plugin]
"
" Opens the given plugin on GitHub. Without an argument, opens the vim-plug
" repo on GitHub.
command! -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>)
