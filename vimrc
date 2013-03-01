" Initialization {{{

" We don't want vi compatibility.
set nocompatible

" Load pathogen.vim
source ~/.vim/bundle/pathogen/autoload/pathogen.vim
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

" }}}

" Indentation {{{

" set nosmartindent
" set nocindent

" }}}

" Statusline {{{

function! s:draw_statusline()
  " [filename]
  let status  = "%F "

  " [✘]
  let status .= "%{&mod ? '[✘]' : ''}"

  " [RO]
  let status .= "%r"

  " [Help]
  let status .= "%h"

  " [Preview]
  let status .= "%w"

  " [Git(branchname)]
  let status .= "%{fugitive#statusline()}"

  " [FT:TYPE FF:FORMAT]
  let status .= "[FT:%{&ft} FF:%{&ff}]"

  " [L:#/# C:# (#%)]
  let status .= "[L:%l/%L C:%v (%p%%)]"

  return status
endfunction

let &statusline = s:draw_statusline()

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

" }}}

" Window settings {{{

set viewoptions=folds,cursor
set foldmethod=manual
set fillchars+=vert:│

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

" Toggle wrap/no wrap
nnoremap <leader>wr :set nowrap! nowrap?<cr>

" Toggle paste mode
nnoremap <leader>pa :set paste! paste?<cr>

" Toggle line numbers
nnoremap <leader>n :set number! number?<cr>

" Toggle list
nnoremap <leader>l :set list! list?<cr>

" Toggle Background color
command ToggleBG let &bg = &bg == 'dark' ? 'light' : 'dark'
" nnoremap <leader>bg :ToggleBG<cr>

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

" Make ctrl+a/ctrl+e work in insert mode
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$

" Make ctrl+a jump to beginning of line in command mode
cnoremap <C-a> <C-b>

" }}}

" Window Movement {{{

" Jump to the next buffer
nnoremap + :bnext<cr>

" Jump to the previous buffer
nnoremap - :bprev<cr>

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
nnoremap <leader>R :Remove<cr>

" Shortcut for typing :help
nnoremap <leader>h :help<space>

" Mkdir => !mkdir
cabbrev mkdir <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "!mkdir" : "mkdir"<CR>

" Insert the directory of the current buffer in command line mode
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" }}}

" }}}

" Plugin Settings/Filetype maps {{{

" ack.vim {{{

noremap <leader>f :Ack!<space>
noremap <leader>F :Ack! <c-r><c-w>

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

" CommandT {{{

let g:CommandTMaxHeight = '15'

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

let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'php']

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
  autocmd FileType ruby noremap <buffer> <leader>s :AS<cr>

  " Open or create the associated file in a vertical split
  autocmd FileType ruby noremap <buffer> <leader>v :AV<cr>

  " Setup `:make`:
  "   * run `rspec` for `_spec.rb` files
  "   * run `ruby -wc` for other `.rb`
  autocmd FileType ruby
    \ if expand("%") =~# '_spec\.rb$' |
    \   compiler rspec | setl makeprg=rspec\ $*|
    \ else |
    \   compiler ruby | setl makeprg=ruby\ -wc\ \"%:p\" |
    \ endif
augroup END

" }}}

" Searching {{{

" Open a Quickfix window for the last search.
nnoremap <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" }}}

" supertab.vim {{{

let g:SuperTabNoCompleteBefore      = []
let g:SuperTabNoCompleteAfter       = ['^', '\s']
let g:SuperTabDefaultCompletionType = '<C-n>' " Reverse order

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

" }}}

" Include local vim config {{{

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

" }}}

" vim:ft=vim:fdm=marker:ts=2:sw=2:sts=2:et
