" Initialization {{{

" Load plugins
source ~/.vim/plug-setup.vim

" Set background and colorscheme
set background=dark
colorscheme solarized

" }}}

" General settings {{{

" Allow UTF8 chars
set encoding=utf-8

" Fast terminal connection, improves redrawing
set ttyfast

" Set dictionary path
set dictionary+=/usr/share/dict/words

" Enable modelines
set modelines=1

" Don't give the intro message when starting Vim
set shortmess+=I

" Hide ins-completion-menu messages
set shortmess+=c

" Hide "-- INSERT --" etc on last line (lightline does this already)
set noshowmode

" Ctags files
set tags=./.git/tags;

" }}}

" Whitespace {{{

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set textwidth=78

" Only one space after punctuation
set nojoinspaces

" }}}

" Invisibles {{{

if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  let &showbreak = "\u21aa"
endif

" }}}

" Searching {{{

set hlsearch
set ignorecase
set smartcase

" }}}

" Split {{{

" Horizontal splits open below the current buffer
set splitbelow

" Vertical splits open to the right of the current buffer
set splitright

" Let the min height 0 (useful with <C-w>_)
set winminheight=0

" }}}

" Backup {{{

set backupskip+=*.tmp,crontab.*
set noswapfile
set directory^=~/.vim/data/swap//
set backupdir^=~/.vim/data/backup//
set undodir^=~/.vim/data/undo//
set undofile

" }}}

" Window settings {{{

set viewoptions=folds,cursor
set foldmethod=manual
set fillchars+=vert:│
set number

" Disable scrolloff that is set in sensible.vim
set scrolloff=0
set sidescrolloff=0

" }}}

" Command line completion {{{

set wildmode=longest:full,full

" Allow <c-z> in maps to open completion menu
set wildcharm=<c-z>

" }}}

" Mappings {{{

let g:mapleader = ','

" Repeat latest f, t, F or T in opposite direction
nnoremap \ ,

" Formatting/editing text {{{

" Format paragraph
vnoremap <C-q> gq
nnoremap <C-q> gqap
inoremap <C-q> <C-o>gqap

" ctrl+j/ctrl+k to move up/down in insert mode
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

" }}}

" Text Movement {{{

" Make Y consistent with C and D. See :help Y.
nnoremap Y y$

" }}}

" Window Movement {{{

" Cycle through open buffers
nnoremap <Leader>b :buffer <C-z>

" }}}

" Convenience {{{

" Remap space to :
noremap <space> :

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" :Rename, opens command line with `:Rename current_file`
nnoremap <leader>r :Rename <c-r>=expand('%:t')<cr><space>

" :Remove, deletes current buffer/file.
nnoremap <leader>R :Remove

" Shortcut for typing :help
nnoremap <leader>h :help<space>

" Insert space before selection
vnoremap <C-@> I<space><esc>gv

" }}}

" }}}

" Plugin Settings/Filetype maps {{{

" ack.vim {{{

noremap <leader>f :Ack!<space>

if executable("ag")
  let g:ackprg = "ag --vimgrep"
endif

let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

" }}}

" Buffers (performed on every buffer) {{{

augroup all_buffers
  autocmd!

  " Resize splits when the window is resized
  autocmd VimResized * exe 'normal! \<c-w>='

  " Remember last location in file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

augroup END

" }}}

" ctrlp {{{

" CtrlP: Use `git ls-files` in git projects, otherwise fall back to `ag`
let g:ctrlp_user_command = [
  \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
  \ 'ag %s --files-with-matches --nocolor --follow -g ""'
  \ ]

" ag/git ls-files are fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:10,results:30'

" ^b opens CtrlP buffer search
noremap <c-b> :CtrlPBuffer<cr>

" ^t opens CtrlP tag search
noremap <c-t> :CtrlPTag<cr>

" }}}

" Dispatch {{{

" Run Dispatch for the current file
map <leader>d :Dispatch<cr>

" Run Dispatch for the current line
map <leader>D :.Dispatch<cr>

augroup setup_dispatch
  autocmd BufReadPost *
    \ if getline(1) =~# '^#!' |
    \   let b:dispatch = getline(1)[2:-1] . ' %' |
    \   let b:start = b:dispatch |
    \ endif
augroup END

" }}}

" EasyAlign {{{

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

" filebeagle.vim {{{

let g:filebeagle_suppress_keymaps = 1
map <silent> - <Plug>FileBeagleOpenCurrentBufferDir

" }}}

" Gutentags {{{

" Keep tags files under .git
let g:gutentags_tagfile = ".git/tags"
let g:gutentags_auto_set_tags = 0

" }}}

" liquid.vim {{{

let g:liquid_highlight_types = ['ruby', 'javascript']

" }}}

" Lightline.vim {{{

let g:lightline = { 'colorscheme': 'solarized' }

function s:set_lightline()
  if has('gui_running') || (exists('g:colors_name') && g:colors_name == 'solarized')
    runtime autoload/lightline/colorscheme/solarized.vim
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
  endif
endfunction

augroup lightline_setup
  autocmd!

  autocmd ColorScheme * call s:set_lightline()
augroup END

" }}}

" netrw.vim {{{

" Use <cWORD> instead of <cfile> for URLs (allows GET params)
let g:netrw_gx = '<cWORD>'

" }}}

" noops - stuff that is purposely disabled {{{

" Disable F1 help menu
nnoremap <F1> <nop>
inoremap <F1> <nop>

" }}}

" plug.vim {{{

" :PU  - Reload plugin setup and run PlugUpdate
" :PU! - Reload plugin setup, run PlugClean and PlugUpdate
command! -bang PU
  \ source ~/.vim/plug-setup.vim |
  \ if <bang>0 |
  \   :PlugClean |
  \ endif |
  \ :PlugUpdate

" }}}

" Quickfix windows {{{

augroup ft_quickfix
  autocmd!

  " Quickfix windows always on bottom, full window width
  autocmd FileType qf wincmd J

  " Cleanup quickfix windows so they're not so ugly
  autocmd BufNewFile,BufRead *
    \ if &bt =~# '^\%(quickfix\|nofile\)$' |
    \   setlocal colorcolumn=0 nolist nocursorline nowrap foldcolumn=0 |
    \ endif
augroup END

" QFEnter.vim {{{

let g:qfenter_open_map            = ['<CR>', 'o']
let g:qfenter_vopen_map           = ['v']
let g:qfenter_hopen_map           = ['h']
let g:qfenter_topen_map           = ['t']
let g:qfenter_enable_autoquickfix = 0

" }}}

" }}}

" rails.vim {{{

augroup ft_rails
  " Open the associated file in a horizontal split (overrides map in ft_ruby)
  autocmd User Rails noremap <buffer> <leader>s :AS<cr>

  " Open the associated file in a vertical split (overrides map in ft_ruby)
  autocmd User Rails noremap <buffer> <leader>v :AV<cr>
augroup END

" }}}

" rsi.vim {{{

" Disable meta maps, causes a jump to back to insert mode if `<ESC>b` is
" pressed too fast in insert mode.
let g:rsi_no_meta = 1

" }}}

" Searching {{{

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" }}}

" searchant.vim {{{

" Clears Searchant highlight redraw window
nmap <C-L> <Plug>SearchantStop:redraw!<cr>

" }}}

" splitjoin.vim {{{

" No trailing comma when splitting Ruby hashes
let g:splitjoin_ruby_trailing_comma = 0

" }}}

" togglelist.vim

let g:toggle_list_no_mappings = 1
nnoremap <silent> coq :call ToggleQuickfixList()<cr>

" }}}

" unimpaired.vim {{{

" Open insert mode with 'paste'
nmap yp <Plug>unimpairedPastei

" }}}

" }}}

" Include local vim config {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:ts=2:sw=2:sts=2:et
