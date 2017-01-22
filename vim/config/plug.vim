" ------------------------------------------------------------------------------
" Plugin setup via vim-plug
" ------------------------------------------------------------------------------

" Disable shallow clones
let g:plug_shallow = 0

call plug#begin()

" Core
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-characterize'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'itchyny/lightline.vim'
Plug 'yssl/QFEnter'
Plug 'timakro/vim-searchant'

" Colors
Plug 'altercation/vim-colors-solarized'

" File browsing/search
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'mhinz/vim-grepper'

if executable("fzf")
  Plug '/usr/local/opt/fzf'
endif

" Ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'vim-ruby/vim-ruby'
Plug 'sunaku/vim-ruby-minitest'
Plug 'janko-m/vim-test'

" Bash
Plug 'markcornick/vim-bats'

" Markdown/Jekyll
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'

" Javascript
Plug 'itspriddle/vim-javascript-indent'
Plug 'itspriddle/vim-jquery'
Plug 'kchmck/vim-coffee-script'

" HTML5
Plug 'othree/html5.vim'

" CSS
Plug 'hail2u/vim-css3-syntax'

" Other syntax
Plug 'evanmiller/nginx-vim-syntax'
Plug 'pearofducks/ansible-vim'

" Git integration
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" ctags integration
if executable("ctags")
  Plug 'ludovicchabant/vim-gutentags'
endif

if has("mac")
  " Documentation viewer (OS X only)
  Plug 'rizzatti/dash.vim'
endif

" My stuff
Plug '~/.vim/plugged/supplemental'

let g:plug_url_format = 'git@github.com:%s.git'

Plug 'itspriddle/vim-stripper'
Plug 'itspriddle/vim-jekyll'
Plug 'itspriddle/vim-marked'
Plug 'itspriddle/applescript.vim'

unlet g:plug_url_format

call plug#end()

" vim:ft=vim:ts=2:sw=2:sts=2:et:fdm=marker
