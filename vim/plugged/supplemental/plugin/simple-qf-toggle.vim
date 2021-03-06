" simple-qf-toggle.vim
" Author:  Joshua Priddle <jpriddle@me.com>
" Version: 0.0.0
" License: Same as Vim itself (see :help license)

if &cp || exists("g:simple_qf_toggle_loaded") && g:simple_qf_toggle_loaded
  finish
else
  let g:simple_qf_toggle_loaded = 1
endif

let s:openers = { "c": "botright copen", "l": "lopen" }

" Private: Toggles visibility of the Quickfix/Location List window.
"
" prefix - Command prefix, "c" for quickfix, "l" for Location List
"
" Returns nothing.
function! s:toggle(prefix)
  let cnt = tabpagewinnr(tabpagenr(), "$")

  execute a:prefix . "close"

  if cnt == tabpagewinnr(tabpagenr(), "$")
    try
      execute s:openers[a:prefix]
    catch /E776/ " Location List can't be opened if it is empty
      echohl ErrorMsg
      echo "E776: No location list"
      echohl None
    endtry
  endif
endfunction

" Define your own maps, eg:
"
"   " Toggle Quickfix
"   nmap <leader>q <Plug>(simple-qf-toggle)
"   command! ToggleQF exe "normal \<Plug>(simple-qf-toggle)"
"
"   " Toggle Location List
"   nmap <leader>l <Plug>(simple-qf-toggle-ll)
"   command! ToggleLL exe "normal \<Plug>(simple-qf-toggle-ll)"
nnoremap <silent> <Plug>(simple-qf-toggle)    :<C-U>call <SID>toggle("c")<CR>
nnoremap <silent> <Plug>(simple-qf-toggle-ll) :<C-U>call <SID>toggle("l")<CR>
