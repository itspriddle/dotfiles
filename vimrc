" Initialization {{{

" We don't want vi compatibility.
set nocompatible

" Load pathogen.vim
runtime bundle/pathogen/autoload/pathogen.vim

" Manually load sensible.vim, to enable syntax, etc before pathogen loads
" other plugins
runtime bundle/sensible/plugin/sensible.vim

" Load plugins
call pathogen#infect()

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
set directory^=~/Library/Vim/swap//,~/local/share/vim/swap//
set backupdir^=~/Library/Vim/backup//,~/local/share/vim/backup//
set undodir^=~/Library/Vim/undo//,~/local/shared/vim/undo//
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

" }}}

" Mappings {{{

let g:mapleader = ','

" Toggles {{{

" Toggle Background color
command ToggleBG let &bg = &bg == 'dark' ? 'light' : 'dark'
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

" Show open buffers prep `:buffer ` on command line
nnoremap <leader>b :buffers<cr>:buffer<space>

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

" }}}

" }}}

" Plugin Settings/Filetype maps {{{

" ack.vim {{{

noremap <leader>f :Ack!<space>

if executable("ag")
  let g:ackprg = 'ag --nogroup --nocolor --column'
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
  highlight Search term=reverse ctermfg=235 ctermbg=221
  highlight Pmenu ctermfg=0 ctermbg=225 guibg=LightMagenta
  highlight PmenuSel ctermfg=0 ctermbg=7 guibg=Grey
  highlight PmenuSbar ctermbg=248 guibg=Grey
  highlight PmenuThumb ctermbg=0 guibg=Black
endif

" }}}

" AppleScript {{{

augroup ft_applescript
  autocmd!

  " Enable syntax highlighting for .scpt files or files with an AppleScript
  " shebang
  autocmd BufNewFile,BufRead *.scpt set ft=applescript
  autocmd BufNewFile,BufRead *
   \ if getline(1) =~ '^#!.*\<osascript\>' | set ft=applescript | endif

  " Teach Tcomment about AppleScript comments
  autocmd FileType applescript :call tcomment#DefineType('applescript', '-- %s')
augroup END

" }}}

" CoffeeScript {{{

augroup ft_coffee
  autocmd!

  " Compile the current buffer in a vertical split
  autocmd FileType coffee nnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>

  " Compile the current selection in a vertical split
  autocmd FileType coffee vnoremap <buffer> <leader>cc :CoffeeCompile vert<cr>

  " Compile and run the current buffer
  autocmd FileType coffee nnoremap <buffer> <leader>cr :CoffeeRun<cr>
  autocmd FileType coffee vnoremap <buffer> <leader>cR :CoffeeRun<cr>

  " Compile the current buffer, output the result to a new file.
  autocmd FileType coffee nnoremap <buffer> <leader>cm :CoffeeMake<cr>

  " Same as above, Intentionally has no <cr> so an option can be added
  autocmd FileType coffee nnoremap <buffer> <leader>cM :CoffeeMake
augroup END

" }}}

" Crontab {{{

augroup ft_crontab
  autocmd!

  " Don't wrap long lines
  autocmd FileType crontab setl textwidth=0
augroup END

" }}}

" ctrlp {{{

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'

" }}}

" CSS {{{

augroup ft_css
  autocmd!

  " Fold on @group/@end like CSSEdit
  autocmd FileType css,scss setl tw=0 foldmethod=manual foldmarker=@group,@end
augroup END

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
  autocmd FileType gitconfig setl noexpandtab spell

  " Place the cursor at the top of the buffer
  autocmd FileType gitcommit exe 'normal! gg'

  " Rebase shortcuts, press P, R, E, S, F to change the current line to the
  " given command. Press C to cycle through available commands.
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> P :Pick<cr>
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> R :Reword<cr>
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> E :Edit<cr>
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> S :Squash<cr>
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> F :Fixup<cr>
  autocmd VimEnter git-rebase-todo nnoremap <buffer> <silent> C :Cycle<cr>

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
    \ setl wrap filetype=gitcommit textwidth=0 linebreak spell

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

" Javascript {{{

augroup ft_javascript
  autocmd!

  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.json set ft=javascript
augroup END

" }}}

" liquid.vim {{{

let g:liquid_highlight_types = ['ruby', 'javascript']

" }}}

" Make {{{

augroup ft_make
  autocmd!

  " make uses real tabs
  autocmd FileType make setl noexpandtab softtabstop=4 tabstop=4 shiftwidth=4
augroup END

" }}}

" Markdown {{{

augroup ft_markdown
  autocmd!

  " Setup wrapping for text files
  autocmd BufRead,BufNewFile *.{txt,md,markdown,mdown,mkd,mkdn} setl wrap textwidth=78
augroup END

" Markded.app view
noremap <leader>mv :MarkedOpen<cr>

" Marked.app quit
noremap <leader>mq :MarkedQuit<cr>

let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'php']

" }}}

" MySQL {{

augroup ft_mysql_config
  autocmd!

  autocmd BufRead,BufNewFile my.cnf,.my.cnf set ft=dosini
augroup END

" }}}

" Lightline.vim {{{

if has('gui_running')
  let g:lightline = {
    \ 'colorscheme':  'solarized_dark',
    \ 'separator':    { 'left': "\U2B80", 'right': "\U2B82" },
    \ 'subseparator': { 'left': "\U2B81", 'right': "\U2B83" },
    \ }
endif

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

" OpenURL: Open stuff in your browser (http://git.io/qaDWKg) {{{

command! -nargs=1 OpenURL :exe '!open <q-args>'

nnoremap gb :OpenURL <cfile><cr>
nnoremap gG :OpenURL http://www.google.com/search?q=<cword><cr>
nnoremap gW :OpenURL http://en.wikipedia.org/wiki/Special:Search?search=<cword><cr>

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

" supertab.vim {{{

let g:SuperTabNoCompleteBefore      = []
let g:SuperTabNoCompleteAfter       = ['^', '\s']
let g:SuperTabDefaultCompletionType = '<C-n>' " Reverse order

" }}}

" tabular.vim {{{

function! s:registerTabularPatterns()
  AddTabularPattern! assignment  /^[^=]*\zs=[>=]\?/
  AddTabularPattern! first_colon /^[^:]*:\zs/l0l1
  AddTabularPattern! first_comma /^[^,]*,\zs/l0r1
  AddTabularPattern! first_dash  /^[^-]*\zs-/
endfunction

function! s:TabularMap(key, pattern)
  for m in ['n', 'v']
    execute m.'noremap <leader>a'.a:key.' :Tabularize '.a:pattern.'<cr>'
  endfor
endfunction

augroup tabular
  autocmd!

  autocmd VimEnter * call s:registerTabularPatterns()
augroup END

call s:TabularMap('=',       'assignment')
call s:TabularMap(':',       'first_colon')
call s:TabularMap(',',       'first_comma')
call s:TabularMap('-',       'first_dash')
call s:TabularMap('<space>', 'multiple_spaces')

" }}}

" tagbar.vim {{{

let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

noremap <leader>T :TagbarToggle<cr>

" }}}

" tmux.vim {{{

augroup ft_tmux
  autocmd!
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
augroup END

" }}}

" togglelist.vim

let g:toggle_list_no_mappings = 1
nnoremap <silent> coq :call ToggleQuickfixList()<cr>

" }}}

" unimpaired.vim {{{

" Open insert mode with 'paste' set
nmap yp yo<BS>

" }}}

" Vim/Vim help {{{

augroup ft_vim
  autocmd!

  " Use K to search :help for the word under the cursor, and use 2 spaces
  autocmd FileType vim setlocal
    \ kp=:help
    \ tabstop=2
    \ shiftwidth=2
    \ softtabstop=2
    \ expandtab

  " Usq q to :quit help buffer
  autocmd FileType help nnoremap <silent> <buffer> q :q<cr>

  " Source
  autocmd FileType vim vnoremap <leader>S y:execute @@<cr>:echo 'Sourced selection.'<cr>
  autocmd FileType vim nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
augroup END

" }}}

" }}}

" Include local vim config {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:ts=2:sw=2:sts=2:et
