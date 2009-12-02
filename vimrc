filetype on 		" Automatically detect file types.
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
""map ,t :FuzzyFinderFile<CR>
map ,t :FuzzyFinderTextMate<CR>

" Code folding
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview

" SLOOW
"let g:closetag_html_style=1
"au Filetype rhtml,erb,html,xml,xsl source ~/.vim/script/closetag.vim

set splitbelow " Split windows BELOW current window!

""""""""""""""""""""""""""""""""""""""
"  Search & Replace
""""""""""""""""""""""""""""""""""""""
set hlsearch   " highlight searches
set ignorecase " make searches case-insensitive, unless they contain upper-case letters:
set smartcase
set incsearch  " show the `best match so far' as search strings are typed:
"set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line:
"set enc=utf-8  " UTF-8 Default encoding'

" FuzzyFinder (default value is <C-l>)
"let g:FuzzyFinderOptions.Base.key_open_tab = '<CR>'
