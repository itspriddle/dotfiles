" Load pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" We don't want vi compatibility.
set nocompatible

" Show line numbers
set number
set ruler

" enable syntax highlighting
syntax on

" Set encoding
set encoding=utf-8

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set listchars=tab:▸\
"set list

" Allow backspacing over everything in insert mode
set bs=indent,eol,start

" Keep 50 items in command history
set history=50

" Show (partial) command in statusline
set showcmd
set showmatch

" Searching
set hlsearch
set ignorecase
set smartcase
set incsearch

" Horizontal splits open below the current buffer
set splitbelow

" Vertical splits open to the right of the current buffer
set splitright

" Backups
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Omni completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage/*

" Statusline
set laststatus=2
"set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [L:%l/%L\ C:%v\ (%p%%)]

" Default colorscheme
set t_Co=256
set background=dark
colorscheme solarized

" Mappings
let mapleader = ","

" ,pa to toggle paste mode
map <leader>pa :set paste!<BAR>:set paste?<CR>

" Disable F1 help menu
nmap <F1> <nop>
imap <F1> <nop>

" Make ctrl+a/ctrl+e work in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$

" Make ctrl+a jump to beginning of line in command mode
cnoremap <C-a> <C-b>

" bind ctrl-l to hashrocket
imap <C-l> <Space>=><Space>

" Remap space to :
noremap <space> :

" Scrolling
noremap J <C-D>
noremap K <C-U>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Window Jumping
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" NERDTree
" ,d to open NERDTree
map <leader>d :NERDTreeToggle<CR>

" Show hidden files in NERDTree
"let NERDTreeShowHidden=1

let NERDChristmasTree=1
let NERDTreeIgnore=['\.pyc$', '\.rbc$', '\~$', 'coverage/*$']

" ack.vim
" ,f to startup an ack search
map <leader>f :Ack<space>

" Tabular.vim
nmap <Leader>a= :Tabularize /=[>]\?<CR>
vmap <Leader>a= :Tabularize /=[>]\?<CR>
nmap <Leader>a: :Tabularize /:\zs*/l0r1<CR>
vmap <Leader>a: :Tabularize /:\zs*/l0r1<CR>

" gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | pbcopy'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" Snipmate
let g:snippets_dir = '~/.vim/bundle/joshs-snippets/,~/.vim/bundle/snipmate-snippets/'

" CommandT
let g:CommandTMaxHeight = 20

" ruby.vim
let ruby_space_errors = 1
let ruby_operators = 1

" rspec.vim
let g:RspecBin = 'rspec'

" Auto Commands

" run `clear` when vim exists
" if ! has("gui")
"   autocmd VimLeave * :!clear
" endif

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC

" Update NERDTree when window is focused
autocmd FocusGained * call s:UpdateNERDTree()

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" make uses real tabs
autocmd FileType make set noexpandtab

" Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" add json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

".txt files
autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

" Strip trailing whitespace before saving
" Markdown uses trailing whitespace, so don't do it if we're editing markdown
autocmd BufWritePre *
\ if &ft !~# '^\%(markdown\|liquid\)$' |
\   :%s/\s\+$//e |
\ endif

" Rememeber last location in file
if has("autocmd")
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" Fix omnicomplete fg color
if ! has("gui")
  highlight PmenuSel ctermfg=black
endif

""" Utility functions

" Quits vim if NERDTree is the only active buffer
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" Setup wrapping for text files
function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=72
endfunction

" Setup Markup and Hammer
function! s:setupMarkup()
  call s:setupWrapping()
  map <buffer> <Leader>p :Hammer<CR>
endfunction

" Refresh NERDTree
function! s:UpdateNERDTree(...)
  let stay = 0

  if(exists("a:1"))
    let stay = a:1
  end

  if exists("t:NERDTreeBufName")
    let nr = bufwinnr(t:NERDTreeBufName)
    if nr != -1
      exe nr . "wincmd w"
      exe substitute(mapcheck("R"), "<CR>", "", "")
      if !stay
        wincmd p
      end
    endif
  endif

  if exists(":CommandTFlush") == 2
    CommandTFlush
  endif
endfunction

