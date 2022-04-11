" ------------------------------------------------------------------------------
" Plugin setup via vim-plug
" ------------------------------------------------------------------------------

" Disable shallow clones
let g:plug_shallow = 0

call plug#begin()

" Core/editor
Plug 'tpope/vim-sensible'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-scriptease'
Plug 'itchyny/lightline.vim'
Plug 'yssl/QFEnter', { 'for': 'qf' }
Plug 'fcpg/vim-altscreen'
Plug 'junegunn/vim-peekaboo'
Plug 'jszakmeister/vim-togglecursor'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }

" Unix
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

" Editing
" Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

" Database
Plug 'tpope/vim-dadbod', { 'on': 'DB' }

" File browsing/search
Plug 'jeetsukumaran/vim-filebeagle'

if executable('fzf')
  for fzf_dir in ['/usr/local', '/opt/homebrew', expand('~/local')]
    if isdirectory(fzf_dir . '/opt/fzf')
      Plug printf('%s/opt/fzf', fzf_dir)
    endif
  endfor
endif

" if executable("ctags") && (has('job') || (has('nvim') && exists('*jobwait')))
"   Plug 'ludovicchabant/vim-gutentags'
" endif

" Testing
" Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Syntax
Plug 'chr4/nginx.vim'
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'itspriddle/vim-jquery'
Plug 'kchmck/vim-coffee-script'
Plug 'markcornick/vim-bats'
Plug 'tpope/vim-liquid'
" Plug 'tpope/vim-markdown'
Plug 'plasticboy/vim-markdown', { 'as': 'vim-markdown-plasticboy' }
Plug 'sunaku/vim-ruby-minitest'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'vito-c/jq.vim'
Plug 'elixir-editors/vim-elixir'

" Git integration
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" My stuff
Plug '~/.vim/plugged/supplemental'

if isdirectory(expand('~/.vim/plugged/vim-notebook'))
  Plug '~/.vim/plugged/vim-notebook'
endif

let g:plug_url_format = 'git@github.com:%s.git'

Plug 'itspriddle/vim-stripper'
Plug 'itspriddle/vim-jekyll'
Plug 'itspriddle/vim-shellcheck'

if has("mac")
  Plug 'itspriddle/vim-marked'
  Plug 'itspriddle/applescript.vim'
endif

unlet g:plug_url_format

call plug#end()

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
