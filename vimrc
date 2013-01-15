" Initialization {{{

" We don't want vi compatibility.
set nocompatible

" Load pathogen.vim
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

" Enable syntax highlighting
syntax on

" Load the plugin and indent settings for the detected filetype
filetype plugin indent on

" }}}

" General settings {{{

" Allow UTF8 chars
set encoding=utf-8

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Keep 500 items in command history
set history=500

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

" }}}

" Indentation {{{

" set autoindent
" set nosmartindent
" set nocindent

" }}}

" Statusline {{{

" Always show the statusline
set laststatus=2

" Set statusline text
set statusline=%F%{&mod\ ?\ '\ [✘]'\ :\ ''}%r%h%w\ %{fugitive#statusline()}\ [FT:%{&ft\ ?\ '%Y'\ :\ 'UNKOWN'}%Y\ FF:%{&ff}]\ [L:%l/%L\ C:%v\ (%p%%)]

" Show (partial) command in statusline
set showcmd

" }}}

" Searching {{{
"
set hlsearch
set ignorecase
set smartcase
set incsearch

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
set viewdir=~/.cache/vim/view//
set noswapfile
set undofile

" }}}

" Window settings (Fold/view) {{{

set viewoptions=folds,cursor
set foldmethod=manual
set fillchars+=vert:│

" }}}

" Command line completion {{{

set wildmenu
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

" Toggle wrap/no wrap
nnoremap <leader>wr :set nowrap! nowrap?<cr>

" Toggle paste mode
nnoremap <leader>pa :set paste! paste?<cr>

" Toggle line numbers
nnoremap <leader>n :set number! number?<cr>

" Toggle list
nnoremap <leader>l :set list! list?<cr>

" Toggle Background color
nnoremap <leader>bg :let &bg = &bg == 'dark' ? 'light' : 'dark'<cr>

" Toggle fold visibility
nnoremap <leader>z za

" }}}

" Formatting/editing text {{{

" opt+U to toggle word case
nnoremap <M-u> g~iw
vnoremap <M-u> g~i
inoremap <M-u> <C-o>g~iw

" Format paragraph
vnoremap <C-q> gq
nnoremap <C-q> gqap
inoremap <C-q> <C-o>gqap

" ctrl+j/ctrl+k to move up/down in insert mode
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk

" create a new line below the current one and jump to it
inoremap <M-o> <C-o>o

" bind ctrl-l to hashrocket
inoremap <C-l> <space>=><space>

" }}}

" Text Movement {{{

" Make ctrl+a/ctrl+e work in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Make ctrl+a jump to beginning of line in command mode
cnoremap <C-a> <C-b>

" Enable extended matching
runtime macros/matchit.vim
map <tab> %

" }}}

" Window Movement {{{

" Jump to the next buffer
nnoremap + :bnext<cr>

" Jump to the previous buffer
nnoremap - :bprev<cr>

" Window Jumping
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" }}}

" Convenience {{{

" Remap space to :
noremap <space> :

" Visually select the text that was last edited/pasted
nnoremap gV `[v`]

" :Rename, opens command line with `:Rename /path/to/current/file`
nnoremap <leader>r :Rename <c-r>=expand('%:p')<cr><space>

" :Remove, deletes current buffer/file.
nnoremap <leader>R :Remove<cr>

" (Safe) quit buffer (:quit)
nnoremap <leader>q :quit<cr>

" Quit buffer (:quit!)
nnoremap <leader>Q :quit!<cr>

" Shortcut for typing :help
nnoremap <leader>h :help<space>

" Mkdir => !mkdir
cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "!mkdir" : "mkdir"<CR>

" }}}

" }}}

" Plugin Settings/Filetype maps {{{

" ack.vim {{{

noremap <leader>f :Ack!<space>
noremap <leader>F :AckFromSearch!<cr>

" }}}

" Buffers (performed on every buffer) {{{

augroup all_buffers
  autocmd!

  " Resize splits when the window is resized
  autocmd VimResized * exe 'normal! \<c-w>='

  " Preserve folds and other view settings across sessions
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview

  " Remember last location in file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

augroup END

" Make search highlighting readable in console Vim
if ! has('gui')
  highlight Search term=reverse ctermfg=235 ctermbg=221
endif

" }}}

" AppleScript {{{

augroup ft_applescript
  autocmd!

  autocmd BufNewFile,BufRead *.scpt set ft=applescript
  autocmd BufNewFile,BufRead *
   \ if getline(1) =~ '^#!.*\<osascript\>' | set ft=applescript | endif
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

" CSS {{{

augroup ft_css
  autocmd!

  " Fold on @group/@end like CSSEdit
  autocmd FileType css,scss setl tw=0 foldmethod=manual foldmarker=@group,@end

  " Format CSS, requires csstidy to be in $PATH
  autocmd FileType css let &l:equalprg='csstidy - --silent=true --preserve_css=true --template=$HOME/.vim/share/support/csstidy.tpl | sed -E "s/,([^ ])/, \1/g"'
augroup END

" }}}

" FileType maps {{{

" Change filetype of the current buffer, useful for unnamed buffers.
nnoremap _ftr :set ft=ruby<cr>
nnoremap _ftv :set ft=vim<cr>
nnoremap _fjs :set ft=javascript<cr>

" }}}

" :<','>Gist [args] (requires gist in PATH) {{{

command -nargs=* -range=% Gist exe '<line1>,<line2>w !gist <args>'

" }}}

" Git (git.vim and fugitive.vim) {{{

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Open GitX (requires gitx in $PATH)
function! s:GitX(...)
  silent exe '!gitx --git-dir='.b:git_dir.' '.join(a:000)
  redraw!
endfunction

augroup ft_git
  autocmd!

  " Place the cursor at the top of the buffer
  autocmd VimEnter .git/COMMIT_EDITMSG exe 'normal! gg'

  " Alias Gpush
  autocmd User Fugitive command! -buffer Gpush exe 'Git push'

  " Open GitX
  autocmd User Fugitive command! -buffer -nargs=* Gitx call s:GitX(<q-args>)
  autocmd User Fugitive noremap <buffer> <leader>gx :Gitx<cr>

  " Alias Gstage (Opens GitX on stage view)
  autocmd User Fugitive command! -buffer Gstage call s:GitX('-c')
  autocmd User Fugitive noremap <buffer> <leader>gt :Gstage<cr>

  " Show git status for the repo
  autocmd User Fugitive noremap <buffer> <leader>gs :Gstatus<cr>

  " Write the current buffer to git index
  autocmd User Fugitive noremap <buffer> <leader>gw :Gwrite<cr>

  " Commit current git index
  autocmd User Fugitive noremap <buffer> <leader>gc :Gcommit -m ""<left>

  " Push current branch upstream
  autocmd User Fugitive noremap <buffer> <leader>gp :Gpush<cr>

  autocmd VimEnter .git/PULLREQ_EDITMSG setl wrap textwidth=0
augroup END

" }}}

" HTML {{{

augroup ft_html
  autocmd!
  autocmd FileType html nnoremap <buffer> <leader>o :!open %<cr>
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

let g:markdown_fenced_languages = ['ruby', 'erb=eruby']

" }}}

" NERDTree.vim {{{

" ,d to open NERDTree
noremap <silent> <leader>d :NERDTreeToggle<cr>

let g:NERDChristmasTree  = 1
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
  " Add :Rfactory command
  autocmd User Rails Rnavcommand factory spec/factories test/factories -suffix=.rb -default=model()

  " Add :Rconfig command
  autocmd User Rails Rnavcommand config config -glob=*.* -suffix= -default=routes.rb

  " Add :Rseeds command
  autocmd User Rails Rnavcommand seeds db -glob=seeds.rb -suffix= -default=seeds.rb

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
  autocmd FileType ruby noremap <buffer> <leader>s :AS!<cr>

  " Open or create the associated file in a vertical split
  autocmd FileType ruby noremap <buffer> <leader>v :AV!<cr>
augroup END

" }}}

" Searching {{{

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" Clear search highlighting
noremap <leader>/ :nohlsearch<cr>

" }}}

" supertab.vim {{{

let g:SuperTabNoCompleteBefore = []
let g:SuperTabNoCompleteAfter  = ['^', '\s']

" }}}

" tabular.vim {{{

function! s:registerTabularPatterns()
  AddTabularPattern! assignment  /^[^=]*\zs=>\?/
  AddTabularPattern! first_colon /^[^:]*:\zs/l0l1
  AddTabularPattern! first_comma /^[^,]*,\zs/l0r1
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
call s:TabularMap('<space>', 'multiple_spaces')

" }}}

" tagbar.vim {{{

let g:tagbar_autofocus = 1
let g:tagbar_compact   = 1

noremap <leader>T :TagbarToggle<cr>

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

" zoomwin.vim {{{

noremap <leader><leader> :ZoomWin<cr>

" }}}

" }}}

" Include local vim config {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:fdm=marker:ts=2:sw=2:sts=2:et
