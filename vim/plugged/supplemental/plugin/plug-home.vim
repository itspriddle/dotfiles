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
  return keys(filter(copy(g:plugs), 'has_key(v:val, "uri") && v:val["uri"] =~ "github" && v:key =~ a:A'))
endfunction

function! s:plug_home(name)
  if empty(a:name)
    return s:open_url('https://github.com/junegunn/vim-plug')
  endif

  let plugs = filter(copy(g:plugs), 'has_key(v:val, "uri") && v:val["uri"] =~ "github"')

  if has_key(plugs, a:name)
    let repo = matchstr(plugs[a:name].uri, '[^:/]*/'.a:name.'\.git$')
    let url = 'https://github.com/'.substitute(repo, '\.git$', '', '')

    call s:open_url(url)
  else
    echomsg 'Unknown plugin '.a:name
  endif
endfunction

command! -nargs=? -complete=customlist,s:plug_list PlugHome :call s:plug_home(<q-args>)
