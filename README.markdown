# Josh's vim config

My (g)vim configurations. It uses Tim Pope's
[vim-pathogen](http://github.com/tpope/vim-pathogen) and
[git submodules](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html)
to keep things relatively tidy.

## Installation

Before installing, backup `~/.vim`, `~/.vimrc` and `~/.gvimrc`

    cd ~
    mkdir vim-backup
    for i in .vim .vimrc .gvimrc; do mv $i vim-backup/$i.bak; done
    rmdir ~/.vim

Clone this repo:

    cd ~
    git clone git://github.com/itspriddle/vim-config.git .vim --recursive
    ln -s .vim/vimrc .vimrc
    ln -s .vim/gvimrc .gvimrc

## Updating

    cd ~/.vim
    git pull origin master
    rake update_plugins

## Included Plugins

The following plugins are installed in `vim/bundle/`

* [ack.vim](https://github.com/mileszs/ack.vim)
* [Command-T](https://github.com/wincent/Command-T)
* [gist-vim](https://github.com/mattn/gist-vim)
* [jekyll.vim](https://github.com/csexton/jekyll.vim)
* [jslint.vim](https://github.com/hallettj/jslint.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
* [snipmate-snippets](https://github.com/scrooloose/snipmate-snippets)
* [snipmate.vim](https://github.com/msanders/snipmate.vim)
* [supertab](https://github.com/ervandew/supertab)
* [tabman.vim](https://github.com/kien/tabman.vim)
* [tabular](https://github.com/godlygeek/tabular)
* [tagbar](https://github.com/majutsushi/tagbar)
* [tcomment_vim](https://github.com/tomtom/tcomment_vim)
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-css-color](https://github.com/ap/vim-css-color)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [vim-eunuch](https://github.com/tpope/vim-eunuch)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-git](https://github.com/tpope/vim-git)
* [vim-haml](https://github.com/tpope/vim-haml)
* [vim-javascript-indent](https://github.com/itspriddle/vim-javascript-indent)
* [vim-jquery](https://github.com/itspriddle/vim-jquery)
* [vim-lesscss](https://github.com/itspriddle/vim-lesscss)
* [vim-liquid](https://github.com/tpope/vim-liquid)
* [vim-markdown](https://github.com/tpope/vim-markdown)
* [vim-mustache](https://github.com/itspriddle/vim-mustache)
* [vim-nerdtree-helpers](https://github.com/itspriddle/vim-nerdtree-helpers)
* [vim-pathogen](https://github.com/tpope/vim-pathogen)
* [vim-rails](https://github.com/tpope/vim-rails)
* [vim-rake](https://github.com/tpope/vim-rake)
* [vim-rspec](https://github.com/taq/vim-rspec)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [vim-speeddating](https://github.com/tpope/vim-speeddating)
* [vim-stripper](https://github.com/itspriddle/vim-stripper)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-themes](https://github.com/itspriddle/vim-themes)
* [ZoomWin](https://github.com/vim-scripts/ZoomWin)
