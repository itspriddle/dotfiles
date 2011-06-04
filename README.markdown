# Josh's vim config

My (g)vim configurations. It uses Tim Pope's
[vim-pathogen](http://github.com/tpope/vim-pathogen) and
[git submodules](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html)
to keep things relatively tidy.

## Installation

Before installing, backup `~/.vim` `~/.vimrc` and `~/.gvimrc`

I keep this repo in `~/Library/dotfiles/vim` and symlink
`~/.vim`, `~/.vimrc` and `~/.gvimrc`. This lets me run a
quick `git pull origin master` to fetch the latest
updates.

    mkdir ~/Library/dotfiles
    cd ~/Library/dotfiles
    git clone git://github.com/itspriddle/vim-config.git vim --recursive
    cd vim
    rake install

## Updating

    cd ~/Library/dotfiles/vim
    rake update_plugins

## Included Plugins

The following plugins are installed in `vim/bundle/`

* [ack.vim](https://github.com/mileszs/ack.vim)
* [Command-T](https://github.com/wincent/Command-T)
* [gist-vim](https://github.com/mattn/gist-vim)
* [jekyll.vim](https://github.com/csexton/jekyll.vim)
* [jslint.vim](https://github.com/hallettj/jslint.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [snipmate-snippets](https://github.com/scrooloose/snipmate-snippets)
* [snipmate.vim](https://github.com/msanders/snipmate.vim)
* [supertab](https://github.com/ervandew/supertab)
* [tabular](https://github.com/godlygeek/tabular)
* [taglist.vim](https://github.com/esukram/taglist.vim)
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
* [vim-conque](https://github.com/rson/vim-conque)
* [vim-endwise](https://github.com/tpope/vim-endwise)
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
* [vim-openser](https://github.com/itspriddle/vim-openser)
* [vim-rails](https://github.com/tpope/vim-rails)
* [vim-rake](https://github.com/tpope/vim-rake)
* [vim-rspec](https://github.com/taq/vim-rspec)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [vim-tcomment](https://github.com/tsaleh/vim-tcomment)
* [vim-themes](https://github.com/itspriddle/vim-themes)
