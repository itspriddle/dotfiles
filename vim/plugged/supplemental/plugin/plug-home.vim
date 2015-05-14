" plug-home.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)
"
" Adds a `:PlugHome` command to browse plugins installed with vim-plug on
" GitHub.
"
" :PlugHome [plugin]
"
" Opens the given plugin on GitHub. Without an argument, opens the vim-plug
" repo on GitHub. Allows tab completion, eg:
"
" :PlugHome sur<tab> => :PlugHome vim-surround

if &cp || !exists("g:plugs") || (exists("g:_plug_home") && g:_plug_home)
  finish
endif

let g:_plug_home = 1

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

command! -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>)
