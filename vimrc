" Initialization {{{

" Load plugins
source ~/.vim/plug-setup.vim

" Manually load sensible.vim, to enable syntax, etc before other plugins are
" loaded
runtime plugged/sensible/plugin/sensible.vim

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

" Show this symbol on lines that are wrapped
set showbreak=↪

" Set listchars
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" }}}

" Indentation {{{

" set nosmartindent
" set nocindent

" }}}

" Searching {{{
"
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

" Ignore these patterns
set wildignore+=.hg,.git,.svn,*.orig                  " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.icns " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest      " compiled object files
set wildignore+=*.spl                                 " compiled spelling word lists
set wildignore+=*.sw?,.netrwhist                      " Vim
set wildignore+=*.DS_Store,Icon\?,*.dfont             " OS X
set wildignore+=*.rbc                                 " Rubinius
set wildignore+=_site                                 " Jekyll

" Allow <c-z> in maps to open completion menu
set wildcharm=<c-z>

" }}}

" Mappings {{{

let g:mapleader = ','

" Repeat latest f, t, F or T in opposite direction
nnoremap \ ,

" Toggles {{{

" Toggle Background color
command ToggleBG let &bg = &bg == 'dark' ? 'light' : 'dark' |
  \ call s:set_lightline()

nnoremap cob :ToggleBG<cr>

" Toggle fold visibility
nnoremap <leader>z za

" }}}

" Formatting/editing text {{{

" Format paragraph
vnoremap <C-q> gq
nnoremap <C-q> gqap
inoremap <C-q> <C-o>gqap

" ctrl+j/ctrl+k to move up/down in insert mode
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

" bind ctrl-l to hashrocket
inoremap <C-l> <space>=><space>

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

" Insert space before selection, useful with ^v
" Doesn't work well with <space> as leader :(
" vnoremap <space> I<space><esc>gv

" }}}

" }}}

" Plugin Settings/Filetype maps {{{

" ack.vim {{{

noremap <leader>f :Ack!<space>

if executable("ag")
  let g:ackprg = 'ag --vimgrep'
endif

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

" Make search/pmenu highlighting readable in console Vim
if ! has('gui_running')
  highlight SpellCap   ctermbg=81  ctermfg=0   term=reverse
  highlight SpellBad   ctermbg=224 ctermfg=0   term=reverse
  highlight Search     ctermbg=221 ctermfg=235 term=reverse
  highlight Pmenu      ctermbg=225 ctermfg=0
  highlight PmenuSel   ctermbg=7   ctermfg=0
  highlight PmenuSbar  ctermbg=248
  highlight PmenuThumb ctermbg=0
endif

" }}}

" Crontab {{{

augroup ft_crontab
  autocmd!

  " Don't wrap long lines
  autocmd FileType crontab setl textwidth=0
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

map <c-b> :CtrlPBuffer<cr>

" }}}

" CSS {{{

augroup ft_css
  autocmd!

  " Fold on @group/@end like CSSEdit
  autocmd FileType css,scss setl tw=0 foldmethod=manual foldmarker=@group,@end
augroup END

" }}}

" Dispatch {{{

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
  \   'pattern': '-',
  \   'left_margin': 1,
  \   'right_margin': 1,
  \   'stick_to_left': 0
  \   }
  \ }

vmap <leader>a= :EasyAlign=<cr>
vmap <leader>a: :EasyAlign:<cr>
vmap <leader>a, :EasyAlign,<cr>
vmap <leader>a- :EasyAlign-<cr>
vmap <leader>a<space> :EasyAlign\<cr>

" }}}

" :<','>Gist [args] (requires gist in PATH) {{{

command -nargs=* -range=% Gist exe '<line1>,<line2>w !gist <args>'

" }}}

" Git (git.vim and fugitive.vim) {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

augroup ft_git
  autocmd!

  " Hard-tabs on gitconfig files
  autocmd FileType gitconfig setl noexpandtab

  " Place the cursor at the top of the buffer, enable spell check
  autocmd FileType gitcommit,gitrebase exe 'normal! gg' | setl spell

  " Rebase shortcuts, press P, R, E, S, F to change the current line to the
  " given command. Press C to cycle through available commands.
  autocmd FileType gitrebase nnoremap <buffer> <silent> P :Pick<cr>
  autocmd FileType gitrebase nnoremap <buffer> <silent> R :Reword<cr>
  autocmd FileType gitrebase nnoremap <buffer> <silent> E :Edit<cr>
  autocmd FileType gitrebase nnoremap <buffer> <silent> S :Squash<cr>
  autocmd FileType gitrebase nnoremap <buffer> <silent> F :Fixup<cr>
  autocmd FileType gitrebase nnoremap <buffer> <silent> C :Cycle<cr>

  " Same as above, but in visual mode. Highlight the previously selected text
  " after changes.
  autocmd FileType gitrebase vnoremap <buffer> <silent> P :s/^\w\+/pick/e<cr>`[v`]
  autocmd FileType gitrebase vnoremap <buffer> <silent> R :s/^\w\+/reword/e<cr>`[v`]
  autocmd FileType gitrebase vnoremap <buffer> <silent> E :s/^\w\+/edit/e<cr>`[v`]
  autocmd FileType gitrebase vnoremap <buffer> <silent> S :s/^\w\+/squash/e<cr>`[v`]
  autocmd FileType gitrebase vnoremap <buffer> <silent> F :s/^\w\+/fixup/e<cr>`[v`]
  autocmd FileType gitrebase vnoremap <buffer> <silent> C :s/^\w\+/cycle/e<cr>`[v`]

  " Alias Gco
  autocmd User Fugitive command! -buffer -nargs=* Gco exe 'Git checkout <args>'

  " Alias Gpush
  autocmd User Fugitive command! -buffer -nargs=* Gpush exe 'Git push <args>'

  " Show git status for the repo
  autocmd User Fugitive noremap <buffer> <leader>gs :Gstatus<cr>

  " Write the current buffer to git index
  autocmd User Fugitive noremap <buffer> <leader>gw :Gwrite<cr>

  " Commit current git index
  autocmd User Fugitive noremap <buffer> <leader>gc :Gcommit -m ""<left>

  " Push current branch upstream
  autocmd User Fugitive noremap <buffer> <leader>gp :Gpush<cr>

  autocmd VimEnter .git/PULLREQ_EDITMSG
    \ setl wrap filetype=gitcommit textwidth=0 linebreak

  " Replace GitHub issue/pull URLS with Markdown shorthand syntax
  " Eg: https://github.com/itspriddle/vim-config/issues/1 becomes
  "     itspriddle/vim-config#1
  autocmd BufWritePre .git/PULLREQ_EDITMSG
    \ execute '%s,\vhttps?://github.com/([^/]+)/([^/]+)/(pull|issues)/([0-9]+),\1/\2#\4,gei'

  " Replace public Dropbox URLs with download URLs when used for Markdown
  " images.
  " Eg: ![My cat is great](https://www.dropbox.com/s/123/MyCat.jpg) becomes
  "     ![My cat is great](https://dl.dropboxusercontent.com/s/123/MyCat.jpg)
  autocmd BufWritePre .git/PULLREQ_EDITMSG
    \ execute '%s,\v!\[(.*)\]\(https://www.dropbox.com,![\1](https://dl.dropboxusercontent.com,gei'
augroup END

" }}}

" HTML {{{

augroup ft_html
  autocmd!

  " Map <leader>o to `open %` on Mac
  if has("mac")
    autocmd FileType html nnoremap <buffer> <leader>o :!open %<cr>
  endif

  autocmd FileType html setl nowrap textwidth=0
augroup END

" }}}

" liquid.vim {{{

let g:liquid_highlight_types = ['ruby', 'javascript']

" }}}

" Markdown {{{

augroup ft_markdown
  autocmd!

  " Marked.app view
  autocmd FileType markdown noremap <buffer> <leader>mv :MarkedOpen<cr>

  " Marked.app quit
  autocmd FileType markdown noremap <buffer> <leader>mq :MarkedQuit<cr>
augroup END

" Use Marked.app (v1)
let g:marked_app = "Marked"

" Setup ``` style syntax highlighting
let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'php', 'sh']

" }}}

" Lightline.vim {{{

function s:set_lightline()
  if has('gui_running')
    let g:lightline = { 'colorscheme':  'solarized_'.&bg }
    call lightline#init()
    call lightline#update()
  endif
endfunction

augroup lightline_setup
  autocmd!

  autocmd ColorScheme * call s:set_lightline()
augroup END

" }}}

" NERDTree.vim {{{

" ,d to open NERDTree
noremap <silent> <leader>d :NERDTreeToggle<cr>

let g:NERDTreeIgnore     = ['\.pyc$', '\.rbc$', '\~$', 'coverage/*$', '\.gem$']
let g:NERDTreeDirArrows  = 1
let g:NERDTreeStatusline = ' '
let g:NERDTreeMinimalUI  = 1

" }}}

" noops - stuff that is purposely disabled {{{

" Disable F1 help menu
nnoremap <F1> <nop>
inoremap <F1> <nop>

" }}}

" Open stuff in your browser {{{

nmap gb :echo "Use gx instead"<cr>

nmap <unique> gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)<cr>

" }}}

" Python {{{

augroup ft_python
  autocmd!

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python setl softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
augroup END

" }}}

" Quickfix windows {{{

augroup ft_quickfix
  autocmd!

  " Cleanup quickfix and help windows so they're not so ugly
  autocmd BufNewFile,BufRead *
    \ if &bt =~# '^\%(quickfix\|nofile\|help\)$' |
    \   setlocal colorcolumn=0 nolist nocursorline nowrap foldcolumn=0 |
    \ endif
augroup END

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

" Ruby {{{

let g:ruby_space_errors = 1
let g:ruby_operators    = 1

augroup ft_ruby
  autocmd!

  " Disable K (ri lookup)
  autocmd FileType ruby noremap <buffer> K <nop>

  " Open or create the associated file in a horizontal split
  autocmd FileType ruby noremap <buffer> <leader>s :AS<cr>

  " Open or create the associated file in a vertical split
  autocmd FileType ruby noremap <buffer> <leader>v :AV<cr>

  " Setup Dispatch's `:Start` to open the given file in IRB
  autocmd FileType ruby let b:start = 'irb -r "%:p"'
augroup END

" }}}

" Searching {{{

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" }}}

" splitjoin.vim {{{

" No trailing comma when splitting Ruby hashes
let g:splitjoin_ruby_trailing_comma = 0

" }}}

" tagbar.vim {{{

let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

noremap <leader>T :TagbarToggle<cr>

" }}}

" togglelist.vim

let g:toggle_list_no_mappings = 1
nnoremap <silent> coq :call ToggleQuickfixList()<cr>

" }}}

" unimpaired.vim {{{

" Open insert mode with 'paste'
nmap yp <Plug>unimpairedPastei

" }}}

" Vim/Vim help {{{

" Only indent once when starting a line with \
let g:vim_indent_cont = 2

augroup ft_vim
  autocmd!

  autocmd FileType vim setlocal
    \ tabstop=2
    \ shiftwidth=2
    \ softtabstop=2
    \ expandtab

  " Usq q to :quit help buffer
  autocmd FileType help nnoremap <silent> <buffer> q :q<cr>
augroup END

" }}}

" }}}

" Include local vim config {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" Deprecated Tcomment maps
nmap <c-_><c-_> gcc:echomsg 'Deprecated: Use gcc instead'<cr>
vmap <c-_><c-_> gc:echomsg 'Deprecated: Use gc instead'<cr>

" vim:ft=vim:ts=2:sw=2:sts=2:et
