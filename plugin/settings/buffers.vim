" Buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Window Jumping
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ,r - :Rename, opens command line with `:Rename /path/to/current/file`
"
" Note that there is an invisible ^R character immediately preceding the =
" sign below. To type it in vim, press ctrl+v, ctrl+r (without releasing the
" ctrl key).
map <leader>r :Rename =expand("%:p")<cr><space>

" ,q - Quit buffer (:quit)
map <leader>q :quit<cr>

" ,Q - Quit buffer (:quit!)
map <leader>Q :quit!<cr>

if has("autocmd")
  " Resize splits when the window is resized
  autocmd VimResized * exe "normal! \<c-w>="

  " Remember last location in file
  autocmd BufReadPost * call s:restoreLastCursorLocation()

  " Preserve folds and other view settings across sessions
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
endif

" Restores the last cursor position, used when opening a new buffer
function! s:restoreLastCursorLocation()
  if line("'\"") > 0 && line ("'\"") <= line("$")
    exe "normal! g'\""
  endif
endfunction
