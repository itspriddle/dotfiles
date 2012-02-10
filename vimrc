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
set dictionary=/usr/share/dict/words

" }}}

" Whitespace {{{

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set textwidth=78

" }}}

" Invisibles {{{

" Highlight hard-tabs, eol and trailing white space
set listchars=tab:▸\ ,eol:¬,trail:·

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
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [T:%Y\ F:%{&ff}]\ [L:%l/%L\ C:%v\ (%p%%)]

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

set backupdir=~/.vim/.backup//
set directory=~/.vim/.backup//
set noswapfile

" }}}

" Window settings (Fold/view) {{{

set viewdir=~/.vim/.view
set viewoptions=folds,cursor
set foldmethod=manual
set fillchars+=vert:│

" }}}

" Command line completion {{{

set wildmode=list:longest

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

let g:mapleader = ","

" Toggle wrap/no wrap
nmap <leader>wr :set nowrap! nowrap?<cr>

" Toggle paste mode
nmap <leader>pa :set paste! paste?<cr>

" Toggle line numbers
nmap <leader>n :set number! number?<cr>

" Toggle list
nmap <leader>l :set list! list?<cr>

" bind ctrl-l to hashrocket
imap <C-l> <space>=><space>

" Toggle fold visibility
map <leader>z za

" Remap space to :
noremap <space> :

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" ctrl+j/ctrl+k to move up/down in insert mode
imap <C-j> <C-o>gj
imap <C-k> <C-o>gk

" opt+U to toggle word case
map <M-u> g~iw
imap <M-u> <C-o>g~iw

" create a new line below the current one
" and jump to it (same as pressing <esc>o)
inoremap <M-o> <C-o>o

" Shortcut for typing :help
nmap <leader>h :help<space>

" Make ctrl+a/ctrl+e work in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$

" Make ctrl+a jump to beginning of line in command mode
cnoremap <C-a> <C-b>

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

" }}}

" Include local vim config {{{

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:fdm=marker:ts=2:sw=2:sts=2:et
