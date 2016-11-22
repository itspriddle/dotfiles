" ------------------------------------------------------------------------------
" Core Vim configuration
" ------------------------------------------------------------------------------

" General {{{

" Set background and colorscheme
set background=dark
colorscheme solarized

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

" Viewing/Editing {{{

" Don't wrap long lines
set nowrap

" Two spaces for tabs
set tabstop=2

" Two spaces for indentation
set shiftwidth=2

" Use spaces when inserting tabs
set expandtab

" Two spaces for inserting tab (use ^V<Tab> to insert a real one)
set softtabstop=2

" 78 columns or you're a heathen...
set textwidth=78

" Only one space after punctuation
set nojoinspaces

" Invisibles
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  let &showbreak = "\u21aa"
endif

" }}}

" Searching {{{

" Highlight searches
set hlsearch

" Ignore case when searching
set ignorecase

" Unless the pattern contains upper case characters
set smartcase

" }}}

" Splits {{{

" Horizontal splits open below the current buffer
set splitbelow

" Vertical splits open to the right of the current buffer
set splitright

" Let the min height 0 (useful with <C-w>_)
set winminheight=0

" }}}

" Backup/Undo {{{

" Don't store backup files for .tmp files or crontabs
"
" TODO: Move crontab setting to ftplugin?
set backupskip+=*.tmp,crontab.*

" Don't use swapfiles
set noswapfile

" Keep swap files under ~/.vim/data/swap (if they're enabled somehow)
set directory^=~/.vim/data/swap//

" Keep backup files under ~/.vim/data/backup
set backupdir^=~/.vim/data/backup//

" Keep undo files under ~/.vim/data/undo
set undodir^=~/.vim/data/undo//

" Enable persistent undo (eg: use ^U in new sessions)
set undofile

" }}}

" Window settings {{{

" Save folds and cursor location when running `:mkview`
set viewoptions=folds,cursor

" Handle folds manually
set foldmethod=manual

" Use a taller (utf) pipe for vertical split borders
set fillchars+=vert:│

" Show line numbers
set number

" Disable (side)scrolloff that is set in sensible.vim
set scrolloff=0 sidescrolloff=0

" }}}

" Command line completion {{{

" Setup completion behavior (always open the wildmenu and complete to the
" fullest match)
set wildmode=longest:full,full

" Allow <c-z> in maps to open completion menu
set wildcharm=<c-z>

" Disable tag completion
set complete-=t

" Disable included file completion
set complete-=i

" }}}

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
