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
endif

let g:_plug_home = 1
let g:_plug_github_repos = filter(g:plugs, 'has_key(v:val, "uri") && v:val["uri"] =~ "github"')

function! s:open_url(url)
  call netrw#BrowseX(a:url, netrw#CheckIfRemote())
endfunction

function! s:plug_list(A, L, P)
  return filter(keys(g:_plug_github_repos), 'v:val =~ a:A')
endfunction

function! s:plug_home(name)
  if empty(a:name)
    call s:open_url('https://github.com/junegunn/vim-plug')
  elseif has_key(g:_plug_github_repos, a:name)
    let plug = g:_plug_github_repos[a:name]
    let uri  = plug['uri']
    let uri  = substitute(uri, '\v\C.git$', '', '')
    let uri  = substitute(uri, '\v\Cgit::\@github\.com', 'github.com', '')
    let uri  = substitute(uri, '\v\Cgit\@github\.com:', 'https://github.com/', '')
    call s:open_url(uri)
  elseif has_key(g:plugs, a:name)
    echomsg 'Error: '.a:name.' is not hosted on GitHub'
  else
    echomsg 'Unknown plugin '.a:name
  endif
endfunction

command! -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>)
