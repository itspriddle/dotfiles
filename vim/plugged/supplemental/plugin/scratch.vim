function! s:Scratch(cmd, options)
    exe a:cmd "Scratch"
    setl buftype=nofile textwidth=0 bufhidden=hide nobuflisted noswapfile
    if !empty(a:options) | exe 'setl' a:options | endif
endfunction

command! -nargs=* Scratch call s:Scratch('split', <q-args>)

" command! -bar -nargs=* Sedit call functions#ScratchEdit('edit', <q-args>)
" command! -bar -nargs=* Ssplit call functions#ScratchEdit('split', <q-args>)
" command! -bar -nargs=* Svsplit call functions#ScratchEdit('vsplit', <q-args>)
" command! -bar -nargs=* Stabedit call functions#ScratchEdit('tabe', <q-args>)
