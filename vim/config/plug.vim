" ------------------------------------------------------------------------------
" Plugin setup via vim-plug
" ------------------------------------------------------------------------------

" Disable shallow clones
let g:plug_shallow = 0

" Find real path to ~/.vim files
let s:vimhome = resolve(fnamemodify(expand('<sfile>'), ':p:h:h'))

call plug#begin(s:vimhome . '/plugged')

if exists('$_JOSH_VIM_PLATFORM')
  let s:platform = $_JOSH_VIM_PLATFORM
elseif has('mac')
  let s:platform = 'macos'
elseif filereadable('/etc/rpi-issue')
  let s:platform = 'linux-rpi'
  let g:plug_shallow = 1
elseif filereadable('/etc/lsb-release')
  let s:platform = 'linux-ubuntu'
elseif filereadable('/etc/centos-release')
  let s:platform = 'linux-centos'
elseif filereadable('/etc/synoinfo.conf')
  let s:platform = 'linux-synology'
elseif executable('freebsd-version')
  let s:platform = 'freebsd'
else
  let s:platform = 'unknown'
endif

" Core/editor
Plug 'tpope/vim-sensible'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-unimpaired'
Plug 'itchyny/lightline.vim'
Plug 'yssl/QFEnter', { 'for': 'qf' }
Plug 'fcpg/vim-altscreen'
Plug 'jszakmeister/vim-togglecursor'
Plug 'tpope/vim-dispatch'

if s:platform == 'macos'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-scriptease'
  Plug 'junegunn/vim-peekaboo'
  Plug 'github/copilot.vim'
endif

" Unix
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

" Editing
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'editorconfig/editorconfig-vim'

" File browsing/search
Plug 'jeetsukumaran/vim-filebeagle'

if s:platform == 'macos'
  Plug 'junegunn/fzf'
else
  Plug 'junegunn/fzf', { 'do': './install --all' }
endif

if s:platform == 'macos'
  " ctags integration
  " if executable("ctags") && (has('job') || (has('nvim') && exists('*jobwait')))
  "   Plug 'ludovicchabant/vim-gutentags'
  " endif

  " Testing
  " Plug 'janko-m/vim-test'

  " Syntax
  Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
  Plug 'hail2u/vim-css3-syntax'
  Plug 'othree/html5.vim'
  Plug 'itspriddle/vim-jquery'
  Plug 'markcornick/vim-bats'
  Plug 'tpope/vim-liquid'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-haml'
  Plug 'vim-ruby/vim-ruby'
  Plug 'elixir-editors/vim-elixir'
  Plug 'jwalton512/vim-blade'
  Plug 'itspriddle/applescript.vim'
  Plug 'noahfrederick/vim-composer'
  " Plug 'noahfrederick/vim-laravel'
  Plug 'yaegassy/nette-neon.vim'
endif

if s:platform == 'macos' || s:platform =~# '^linux-synology'
  " Git integration
  Plug 'tpope/vim-git'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
endif

" Syntax
Plug 'plasticboy/vim-markdown', { 'as': 'vim-markdown-plasticboy' }
" Plug 'tpope/vim-markdown'

" My stuff
call plug#(s:vimhome . '/plugged/supplemental')

let g:plug_url_format = 'git@github.com:%s.git'

Plug 'itspriddle/vim-stripper'

if executable('shellcheck')
  Plug 'itspriddle/vim-shellcheck'
endif

if s:platform == 'macos'
  Plug 'itspriddle/vim-jekyll'
  Plug 'itspriddle/vim-marked'
  Plug 'built-fast/vim-laravel-projections'
endif

unlet g:plug_url_format

call plug#end()

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
