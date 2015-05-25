" plug-home.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)
"
" Adds a `:PlugHome` command to browse plugins installed with vim-plug on
" GitHub. Requires netrw.vim.
"
" :PlugHome [plugin]
"
" Opens the given plugin on GitHub. Without an argument, opens the vim-plug
" repo on GitHub. Allows tab completion, eg:
"
" :PlugHome sur<tab> => :PlugHome vim-surround

if &cp || !exists("g:plugs") || (exists("g:_plug_home") && g:_plug_home)
  finish
else
  let g:_plug_home = 1
endif

function! s:open_url(url)
  call netrw#BrowseX(a:url, netrw#CheckIfRemote())
endfunction

function! s:plug_list(A, L, P)
  return keys(filter(g:plugs, 'has_key(v:val, "uri") && v:val["uri"] =~ "github" && v:key =~ a:A'))
endfunction

function! s:plug_home(name)
  if empty(a:name)
    return s:open_url('https://github.com/junegunn/vim-plug')
  endif

  let plugs = filter(g:plugs, 'has_key(v:val, "uri") && v:val["uri"] =~ "github"')

  if has_key(plugs, a:name)
    let plug = plugs[a:name]
    let uri  = plug['uri']
    let uri  = substitute(uri, '\v\C.git$', '', '')
    let uri  = substitute(uri, '\v\Cgit::\@github\.com', 'github.com', '')
    let uri  = substitute(uri, '\v\Cgit\@github\.com:', 'https://github.com/', '')
    call s:open_url(uri)
  else
    echomsg 'Unknown plugin '.a:name
  endif
endfunction

command! -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>)
