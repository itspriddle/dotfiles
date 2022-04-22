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
"
" Call with a bang to print and copy the URL to the clipboard instead of
" opening in a browser:
"
" :PlugHome! vim-surround

if &cp || !exists("g:plugs") || (exists("g:_plug_home") && g:_plug_home)
  finish
else
  let g:_plug_home = 1
endif

function! s:open_url(url, launch)
  if a:launch
    call netrw#BrowseX(a:url, netrw#CheckIfRemote())
  else
    let @+ = a:url
    echo a:url
  endif
endfunction

function! s:plug_list(A, L, P)
  return keys(filter(copy(g:plugs), 'has_key(v:val, "uri") && v:val["uri"] =~ "github" && v:key =~ a:A'))
endfunction

function! s:plug_home(name, launch)
  if empty(a:name)
    return s:open_url('https://github.com/junegunn/vim-plug', a:launch)
  endif

  let plugs = filter(copy(g:plugs), 'has_key(v:val, "uri") && v:val["uri"] =~ "github"')

  if has_key(plugs, a:name)
    " https://git::@github.com/user/repo.git
    " git@github.com:user/repo.git
    let repo = substitute(plugs[a:name].uri, 'https://github.com/', '', '')
    let repo = substitute(repo, 'https://git::@github.com/', '', '')
    let repo = substitute(repo, 'git@github.com:', '', '')
    let url = 'https://github.com/'.substitute(repo, '\.git$', '', '')

    call s:open_url(url, a:launch)
  else
    echohl Error
    echomsg 'Unknown plugin '.a:name
    echohl None
  endif
endfunction

command! -bang -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>, <bang>1)
