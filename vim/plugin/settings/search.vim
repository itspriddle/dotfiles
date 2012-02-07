" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Clear search highlighting
noremap <leader>/ :nohlsearch<cr>
