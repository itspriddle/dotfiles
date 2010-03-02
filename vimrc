"filetype plugin indent on 		" Automatically detect file types.
filetype plugin on 		" Automatically detect file types.
set nocompatible 	" We don't want vi compatibility.

syntax enable		" enable syntax highlighting
set bs=indent,eol,start " allow backspacing over everything in insert mode
"set ai 		" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50 	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50 		" keep 50 lines of command line history
set ruler 		" show the cursor position all the time
set tabstop=4		" set tab width = 4
set showcmd 		" Show (partial) command in status line.
set showmatch 		" Show matching brackets.
"set autowrite 		" Automatically save before commands like :next and :make
"set hidden 		" Hide buffers when they are abandoned
set mouse=a 		" Enable mouse usage (all modes) in terminals

" Uncomment the following to have Vim load indentation rules according to the
" detected filetype. Per default Debian Vim only load filetype specific
" plugins.
"if has("autocmd")
"  filetype indent on
"endif

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

map ,d :execute 'NERDTreeToggle ' .getcwd()<CR>
nmap ,t :FuzzyFinderTextMate<CR>
nmap ,r :FuzzyFinderMruFile<CR>

" Code folding
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview


" Search & Replace
set hlsearch   " highlight searches
set ignorecase " make searches case-insensitive, unless they contain upper-case letters:
set smartcase
set incsearch  " show the `best match so far' as search strings are typed:
"set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:
"set enc=utf-8  " UTF-8 Default encoding'


" Kill trailing whitespace from documents on save
"autocmd BufWritePre * :%s/\s\+$//e

" Remap space to :
noremap <space> :

" Scrolling
no J 20j
no K 20k

" Disable the arrow keys so you're
" forced to scroll like a man
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" Saw this method too to disable arrows
" noremap  <Up> ""
" noremap! <Up> <Esc>
" noremap  <Down> ""
" noremap! <Down> <Esc>
" noremap  <Left> ""
" noremap! <Left> <Esc>
" noremap  <Right> ""
" noremap! <Right> <Esc>

" Splits
set splitbelow " :sp => open split BELOW
set splitright " :vsp => open vsplit on RIGHT

" Correct some spelling mistakes
ia teh      the
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return
ia sefl     self
ia eslf     self


" gist.vim
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1


" ,F to startup an ack search
map ,f :Ack<space>

" gist.vim
" Copy gist url to clipboard when adding
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | pbcopy'

map <Leader>gco :GitCheckout<space>

" Write file if you forget to `sudo vim'
"command W w !sudo tee % >/dev/null
