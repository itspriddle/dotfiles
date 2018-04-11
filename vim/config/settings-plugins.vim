" ------------------------------------------------------------------------------
" Plugin Settings/Mappings
"
" Configuration and custom mappings used with third party plugins.
" ------------------------------------------------------------------------------

" fzf.vim {{{

" Note this is the fzf.vim shipped with fzf itself, not the separate fzf.vim
" project

let g:fzf_layout = { "down": 10 }

noremap <c-p> :FZF<cr>
noremap <c-b> :echoerr "Use `<leader>b`!"<cr>

nnoremap <leader>b :FZFBuffers<cr>
nnoremap <leader>m :FZFMRU<cr>

" }}}

" lightline.vim {{{

let g:lightline = { 'colorscheme': 'solarized' }

" }}}

" QFEnter.vim {{{

let g:qfenter_keymap              = {}
let g:qfenter_keymap.open         = ['<CR>', 'o']
let g:qfenter_keymap.vopen        = ['v']
let g:qfenter_keymap.hopen        = ['h']
let g:qfenter_keymap.topen        = ['t']
let g:qfenter_enable_autoquickfix = 0

" }}}

" simple-ag.vim {{{

" Opens command line with `:Ag `, results go to Quickfix
noremap <leader>f :Ag<space>

" Opens command line with `:LAg `, results go to Location List
noremap <leader>F :LAg<space>

" }}}

" simple-qf-toggle.vim {{{

" Toggle quickfix, like unimpaired
nmap coq <Plug>(simple-qf-toggle)
nmap coQ <Plug>(simple-qf-toggle-ll)

" }}}

" splitjoin.vim {{{

" No trailing comma when splitting Ruby hashes
let g:splitjoin_ruby_trailing_comma = 0

" }}}

" vim-dispatch {{{

augroup setup_dispatch
  autocmd!

  autocmd BufReadPost *
    \ if getline(1) =~# '^#!' |
    \   let b:dispatch = getline(1)[2:-1] . ' %' |
    \   let b:start    = b:dispatch |
    \ endif
augroup END

" Run Dispatch for the current file
map <leader>d :Dispatch<cr>

" Run Dispatch for the current line
map <leader>D :.Dispatch<cr>

" }}}

" vim-easy-align {{{

" Allow aligning stuff that is commented out
let g:easy_align_ignore_groups = []

" Setup custom alignments
let g:easy_align_delimiters = {
  \ '-':  {
  \   'pattern':       '-',
  \   'left_margin':   1,
  \   'right_margin':  1,
  \   'stick_to_left': 0
  \   }
  \ }

" Map <leader>a[char] => :EasyAlign[char]<cr>
vmap <expr> <leader>a ':EasyAlign'.nr2char(getchar()).'<cr>'

" Space doesn't work with the above map, so define it explicitly.
vmap <leader>a<space> :EasyAlign\<cr>

" Align Markdown style tables, changes:
"
" |foo|bar|foobar|
" |1|2|3|
"
" to
"
" | foo | bar | foobar |
" | 1   | 2   | 3      |
vmap <leader>a<bar> :EasyAlign *<bar><cr>

" }}}

" vim-eunuch {{{

" :Rename, opens command line with `:Rename current_file`
nnoremap <leader>r :Rename <c-r>=expand('%:t')<cr><space>

" :Remove, deletes current buffer/file.
nnoremap <leader>R :Delete

" }}}

" vim-filebeagle {{{

let g:filebeagle_suppress_keymaps = 1
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir

" }}}

" vim-gutentags {{{

" Keep tags files under .git
let g:gutentags_ctags_tagfile = ".git/tags"

" Don't let Gutentags `set tags`
let g:gutentags_ctags_auto_set_tags = 0

" }}}

" vim-liquid {{{

let g:liquid_highlight_types = ['ruby', 'javascript']

" }}}

" vim-peekaboo {{{

" Normal mode:
"   <leader>"
"   <leader>@
"
" Insert mode:
"   <ctrl-r>
let g:peekaboo_prefix	= "<leader>"

" }}}

" vim-rsi {{{

" Disable meta maps, causes a jump to back to insert mode if `<ESC>b` is
" pressed too fast in insert mode.
let g:rsi_no_meta = 1

" }}}

" vim-searchant {{{

" Clears Searchant highlight redraw window
nmap <C-L> <Plug>SearchantStop:redraw!<cr>

" }}}

" vim-test {{{

" make test commands execute using dispatch.vim
let test#strategy = "vimterminal"

" Expose `:RSpec` and `:Minitest` commands
let g:test#runner_commands = ["RSpec", "Minitest"]

" }}}

" vim-unimpaired {{{

" Open insert mode with 'paste'
nmap yp <Plug>unimpairedPastei

" }}}

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
