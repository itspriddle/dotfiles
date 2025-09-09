function! s:composerNamespaceUse() abort
  normal! mz
  execute composer#namespace#use(0)
  normal! `z
endfunction

function! s:ComposerFind() abort
  let class = composer#autoload#find()

  if empty(class)
    return
  endif

  return split(class, ' ')[1]
endfunction

function! s:ComposerNavigate(action) abort
  let l:class = s:ComposerFind()

  if empty(l:class)
    return
  endif

  if a:action ==# 'split'
    execute 'split' l:class
  elseif a:action ==# 'vsplit'
    execute 'vsplit' l:class
  elseif a:action ==# 'tabnew'
    execute 'tabnew' l:class
  else
    execute 'edit' l:class
  endif
endfunction

" Go to file for item under cursor
nnoremap <silent> <buffer> gf :<C-u>execute composer#autoload#find()<CR>

" And since I keep trying to use tags...
nnoremap <silent> <buffer> <C-]> :<C-u>execute composer#autoload#find()<CR>

" Like gf, but in a new split
nnoremap <silent> <buffer> <C-W><C-F> :<C-u>call <SID>ComposerNavigate('split')<CR>

" Like gf, but in a new tab
nnoremap <silent> <buffer> <C-W>gf :<C-u>call <SID>ComposerNavigate('tabnew')<CR>

" Like gf, but in a new vertical split
nnoremap <silent> <buffer> <C-W>gF :<C-u>call <SID>ComposerNavigate('vsplit')<CR>

" " Insert use statement
nnoremap <buffer> gF :<C-u>call <SID>composerNamespaceUse()<CR>

let b:undo_ftplugin = get(b:, "undo_ftplugin", "exe") .
  \ "|execute 'unmap <buffer> gf'" .
  \ "|execute 'unmap <buffer> <C-]>'" .
  \ "|execute 'unmap <buffer> <C-W><C-F>'" .
  \ "|execute 'unmap <buffer> <C-W>gf'" .
  \ "|execute 'unmap <buffer> <C-W>gF'" .
  \ "|execute 'unmap <buffer> gF'"
