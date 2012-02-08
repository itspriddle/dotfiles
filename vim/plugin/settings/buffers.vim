" Buffers

" Jump to the next buffer
nnoremap <Tab> :bnext<cr>

" Jump to the previous buffer
nnoremap <S-Tab> :bprevious<cr>

" Window Jumping
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" :Rename, opens command line with `:Rename /path/to/current/file`
map <leader>r :Rename <c-r>=expand('%:p')<cr><space>

" (Safe) quit buffer (:quit)
map <leader>q :quit<cr>

" Quit buffer (:quit!)
map <leader>Q :quit!<cr>

" Resize splits when the window is resized
autocmd VimResized * exe "normal! \<c-w>="

" Preserve folds and other view settings across sessions
autocmd BufWinLeave * silent! mkview
autocmd BufWinEnter * silent! loadview

" Remember last location in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
