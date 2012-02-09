" Commit the current buffer, optionally pushing.
function! s:Jpublish(push, ...)
  let msg = a:0 ? a:1 : 'Add post'
  Gwrite
  exe 'Gcommit -m '.msg
  if a:push
    Gpush
  endif
endfunction

" :Jpublish               - Commit with 'Add post' as the commit message
" :Jpublish "my message"  - Commit with 'my message' as the commit message
" :Jpublish!              - Same as :Jpublish, but performs a git push
" :Jpublish! "my message" - Same as :Jpublish!, but performs a git push
autocmd User Jekyll command! -bang -nargs=? Jpublish call s:Jcommit(<bang>0, <q-args>)
