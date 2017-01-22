" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:_fzf_helpers") && g:_fzf_helpers
  finish
else
  let g:_fzf_helpers = 1
endif

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

command! FZFBuffers call fzf#run({
  \   'source':  s:list_buffers(),
  \   'options': '--expect='.join(keys(s:default_action), ','),
  \   'sink*':   function("s:handler")
  \ })
