" Initialization {{{

" We don't want vi compatibility.
set nocompatible

" Load pathogen.vim
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

" enable syntax highlighting
syntax on

" load the plugin and indent settings for the detected filetype
filetype plugin indent on

" }}}

" General settings {{{

set encoding=utf-8

" Allow backspacing over everything in insert mode
set bs=indent,eol,start

" Keep 50 items in command history
set history=50

" }}}

" Whitespace {{{

set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set listchars=tab:▸\
"set list

" }}}

" Indentation {{{

" set autoindent
" set nosmartindent
" set nocindent

" }}}

" Statusline {{{

set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [T:%Y\ F:%{&ff}]\ [L:%l/%L\ C:%v\ (%p%%)]

" Show (partial) command in statusline
set showcmd
set showmatch

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

" }}}

" Backup {{{

set backupdir=~/.vim/.backup
set directory=~/.vim/.backup

" }}}

" Fold/view {{{

set viewdir=~/.vim/.view
set viewoptions=folds,cursor
set foldmethod=manual

" }}}

" Omni completion {{{

set wildmode=list:longest,list:full
"set wildmenu
"set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,coverage/*

" }}}

" Mappings {{{

let mapleader = ","

" ,r - :Rename, opens command line with `:Rename /path/to/current/file`
map <leader>r :Rename =expand("%:p")<cr><space>

" ,q - Quit buffer (:quit)
map <leader>q :quit<cr>

" ,Q - Quit buffer (:quit!)
map <leader>Q :quit!<cr>

" ,e - Go to command-mode with cursor at _, eg: ':Edit _'
map <leader>e :Edit<space>

" ,wr to toggle wrap/no wrap
map <leader>wr :set nowrap! nowrap?<cr>

" ,pa to toggle paste mode
map <leader>pa :set paste! paste?<cr>

" ,n to toggle line numbers
map <leader>n :set number! number?<cr>

" ,l to toggle list
map <leader>l :set list! list?<cr>

" Buffers
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Disable F1 help menu
nmap <F1> <nop>
imap <F1> <nop>

" Make ctrl+a/ctrl+e work in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$

" Make ctrl+a jump to beginning of line in command mode
cnoremap <C-a> <C-b>

" bind ctrl-l to hashrocket
imap <C-l> <space>=><space>

" ,s - Open the associated file in a horizontal split (ruby)
map <leader>s :AS<cr>

" ,v - Open the associated file in a vertical split (ruby)
map <leader>v :AV<cr>

" ,z - Toggle fold visibility
map <leader>z zi

" Remap space to :
noremap <space> :

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Window Jumping
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" :w!! to save w/ sudo
cmap w!! w !sudo tee % > /dev/null

" ctrl+j/ctrl+k to move up/down in insert mode
imap <C-j> <C-o>gj
imap <C-k> <C-o>gk

" NERDTree
" ,d to open NERDTree
map <leader>d :NERDTreeToggle<cr>

" opt+U to toggle word case
map <M-u> g~iw
imap <M-u> <C-o>g~iw

" Clear search highlighting
nmap <leader>/ :nohlsearch<cr>

map <M-c> :%s/{\_.\{-}}/\=substitute(submatch(0), '\n', '', 'g')/<cr>

" ack.vim
map <leader>f :Ack<space>

" Tabular.vim
" TODO: use AddTabularPattern! instead of repeating these
nmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<cr>
vmap <Leader>a= :Tabularize /^[^=]*\zs=>\?<cr>
nmap <Leader>a: :Tabularize /^[^:]*:\zs/l0l1<cr>
vmap <Leader>a: :Tabularize /^[^:]*:\zs/l0l1<cr>
nmap <Leader>a, :Tabularize /,\zs/l1r0<cr>
vmap <Leader>a, :Tabularize /,\zs/l1r0<cr>

" ZoomWin
map <leader><leader> :ZoomWin<cr>

" Tagbar
map <leader>T :TagbarToggle<cr>

" }}}

" Plugin settings {{{

" nerdTREE.vim
let g:NERDChristmasTree = 1
let g:NERDTreeIgnore    = ['\.pyc$', '\.rbc$', '\~$', 'coverage/*$']
let g:NERDTreeDirArrows = 1

" gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_browser_command         = 'echo %URL% | pbcopy'
let g:gist_clip_command            = 'pbcopy'
let g:gist_detect_filetype         = 1

" Snipmate
let g:snippets_dir = '~/.vim/bundle/joshs-snippets/,~/.vim/bundle/snipmate-snippets/'
source ~/.vim/bundle/snipmate-snippets/support_functions.vim

" CommandT
" let g:CommandTMaxHeight = 20

" ruby.vim
let g:ruby_space_errors = 1
let g:ruby_operators    = 1

" rspec.vim
let g:RspecBin = 'rspec'

" tagbar.vim
let g:tagbar_ctags_bin = '/opt/local/bin/ctags'
let g:tagbar_autofocus = 1

" }}}

" Auto Commands {{{

if has("autocmd")
  " make uses real tabs
  autocmd FileType make set noexpandtab

  " Thorfile, Rakefile, Vagrantfile and Gemfile are Ruby
  autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru} set ft=ruby

  " md, markdown, and mk are markdown and define buffer-local preview
  autocmd BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupWrapping()

  " add json syntax highlighting
  autocmd BufNewFile,BufRead *.json set ft=javascript

  ".txt files
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

  " Save folds
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview

  " CSS
  "autocmd filetype css,scss set foldmethod=marker foldmarker=@group,@end
  autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true

  autocmd VimEnter .git/COMMIT_EDITMSG exe "normal! gg"

  " Rememeber last location in file
  autocmd BufReadPost * call s:restoreLastCursorLocation()

  " Doesnt work right
  "autocmd TabEnter * silent! TMFocus

  " Resize splits when the window is resized
  au VimResized * exe "normal! \<c-w>="
endif

" }}}

" Functions {{{

" Restores the last cursor position, used when opening a new buffer
function! s:restoreLastCursorLocation()
  if line("'\"") > 0 && line ("'\"") <= line("$")
    exe "normal! g'\""
  endif
endfunction

" Setup wrapping for text files
function! s:setupWrapping()
  set wrap
  set wrapmargin=2
  set textwidth=78
endfunction

" }}}

" Include local vim config {{{

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:foldmethod=marker:foldlevel=0
