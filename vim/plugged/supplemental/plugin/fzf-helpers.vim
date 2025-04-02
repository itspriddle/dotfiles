" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:_fzf_helpers") && g:_fzf_helpers
  finish
else
  let g:_fzf_helpers = 1
endif

" Defaults from fzf.vim (the one that ships with FZF)
let s:fzf_layout = get(g:, 'fzf_layout', { 'window': { 'width': 0.9, 'height': 0.6 } })

function! s:format_buffer(b)
  let name = bufname(a:b)
  let name = empty(name) ? '[No Name]' : fnamemodify(name, ":~:.")
  return name
endfunction

function! s:list_buffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
  let buffers = map(buffers, 's:format_buffer(v:val)')

  return reverse(buffers)
endfunction

let s:default_action = {
  \ 'ctrl-t': 'tabe',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }

function! s:handler(lines)
  if len(a:lines) < 2
    return
  endif

  execute get(s:default_action, a:lines[0], 'e') a:lines[1]
endfunction

  " let short = fnamemodify(getcwd(), ':~:.')
command! FZF call fzf#run(extend(fzf#wrap('FZF', {
  \   'options': '--prompt=" › " --expect='.join(keys(s:default_action), ','),
  \ }), s:fzf_layout))

command! FZFBuffers call fzf#run(extend({
  \   'source':  s:list_buffers(),
  \   'options': '--prompt="buffers › " --expect='.join(keys(s:default_action), ','),
  \   'sink*':   function("s:handler")
  \ }, s:fzf_layout))

function! s:mru_files(cwd)
  let mru = filter(copy(v:oldfiles), 'filereadable(fnamemodify(v:val, ":p"))')

  if a:cwd
    let l:cwd = getcwd()
    let mru = filter(mru, 'fnamemodify(v:val, ":p") =~# "^".l:cwd')
    return map(mru, "substitute(fnamemodify(v:val, ':p'), '^'.l:cwd.'/', '', '')")
  else
    return mru
  endif
endfunction

command! -bang FZFMRU call fzf#run(extend({
  \   'source':  s:mru_files(<q-bang> == ""),
  \   'options': '--prompt="mru › " --expect='.join(keys(s:default_action), ','),
  \   'sink*':   function("s:handler")
  \ }, s:fzf_layout))


function! s:tags_sink(line)
  let parts = split(a:line, '\t\zs')
  let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  execute 'silent e' parts[1][:-2]
  let [magic, &magic] = [&magic, 0]
  execute excmd
  let &magic = magic
endfunction

function! s:tags()
  if empty(tagfiles())
    echohl WarningMsg
    echom 'Preparing tags'
    echohl None
    call system('ctags -R')
  endif

  call fzf#run(extend({
    \ 'source':  'cat '.join(map(tagfiles(), 'fnamemodify(v:val, ":S")')).
    \            '| grep -v -a ^!',
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'sink':    function('s:tags_sink')}, s:fzf_layout))
endfunction

command! Tags call s:tags()
