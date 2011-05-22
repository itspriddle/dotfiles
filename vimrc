" Load pathogen.vim
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible        " We don't want vi compatibility.

syntax enable           " enable syntax highlighting

set bs=indent,eol,start " allow backspacing over everything in insert mode
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set tabstop=4           " set tab width = 4
set shiftwidth=4
set noexpandtab
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.

set hlsearch            " highlight searches
set ignorecase          " make searches case-insensitive, unless they contain upper-case letters:
set smartcase
set incsearch           " show the `best match so far' as search strings are typed:
"set gdefault           " assume the /g flag on :s substitutions to replace all matches in a line:
"set enc=utf-8          " UTF-8 Default encoding

set splitbelow          " :sp => open split BELOW
set splitright          " :vsp => open vsplit on RIGHT

if has("autocmd")
  filetype indent on

  autocmd FileType *   set ai sw=2 sts=2 et
  autocmd FileType php set ai sw=4 sts=4 noet
  autocmd FileType js  set ai sw=2 sts=2 et

  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78

  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

  " Strip trailing whitespace before saving
  " Markdown uses trailing whitespace, so don't
  " do it if we're editing markdown
  "autocmd BufWritePre *
  "\ if &ft !~# '^\%(markdown\|liquid\)$' |
  "\   :%s/\s\+$//e |
  "\ endif

  " highlight trailing whitespace in red
  highlight ExtraWhitespace ctermbg=red guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

endif

"let ruby_no_trail_space_error=1

let mapleader = ","

set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]

" Remap space to :
noremap <space> :

" Scrolling
noremap J <C-D>
noremap K <C-U>

" Disable the arrow keys so you're
" forced to scroll like a man
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

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


" ,d to open NERDTree
" refresh it after opening so we see any changes
map <leader>d :NERDTreeToggle<CR>

" ,F to startup an ack search
map <leader>f :Ack<space>

" gist.vim
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'echo %URL% | pbcopy'
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

" ,gco to run :GitCheckout
map <leader>gco :GitCheckout<space>

" bind ctrl-l to hashrocket
imap <C-l> <Space>=><Space>

" Write file if you forget to `sudo vim'
"command W w !sudo tee % >/dev/null

"set listchars=tab:▸\
"set list

" Snipmate
let g:snippets_dir = '~/.vim/bundle/joshs-snippets/,~/.vim/bundle/snipmate-snippets/'

" Window Jumping
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Map Ctrl-D to Ctrl-N for autocompletion similar to TextMate
imap <C-D> <C-N>

"let php_sql_query = 1
"let php_htmlInStrings = 1

" NERDTree utility function
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

autocmd FocusGained * call s:UpdateNERDTree()

let g:CommandTMaxHeight = 10

" Automatically load .vimrc source when saved
autocmd BufWritePost .vimrc source $MYVIMRC

if ! has("gui")
  " Fix omnicomplete fg color
  highlight PmenuSel ctermfg=black
endif
