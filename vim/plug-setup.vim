call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-git'
Plug 'vim-ruby/vim-ruby'
Plug 'mileszs/ack.vim'
Plug 'itspriddle/vim-javascript-indent'
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'godlygeek/tabular'
Plug 'altercation/vim-colors-solarized'
Plug 'itspriddle/vim-jquery'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-commentary'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'othree/html5.vim'
Plug 'tpope/vim-abolish'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'itspriddle/ZoomWin'
Plug 'tpope/vim-sensible'
Plug 'vim-scripts/applescript.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-characterize'
Plug 'milkypostman/vim-togglelist'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-projectionist'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'gregsexton/gitv'

" My stuff
Plug '~/.vim/supplemental'

let g:plug_url_format = 'git@github.com:%s.git'

Plug 'itspriddle/vim-stripper'
Plug 'itspriddle/vim-jekyll'
Plug 'itspriddle/vim-marked'

unlet g:plug_url_format

" Plug 'tpope/vim-bundler'
" Plug 'ervandew/supertab'
" Plug 'hallettj/jslint.vim'

call plug#end()

" vim:ft=vim:ts=2:sw=2:sts=2:et
