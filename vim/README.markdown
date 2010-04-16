vim smackdown
=============
My (g)vim configurations. It uses Tim Pope's
vim-pathogen to keep things relatively tidy.

Installation
------------
Before installing, backup ~/.vim ~/.vimrc and ~/.gvimrc

I keep this repo in ~/Library/dotfiles/vim and symlink
~/.vim ~/.vimrc and ~/.gvimrc. This lets you run a
quick `git pull origin master` to fetch the latest
updates.

	mkdir ~/Library/dotfiles
    cd ~/Library/dotfiles
    git clone git://github.com/itspriddle/vim-config.git vim
    cd vim
    git submodule init
    git submodule update
    rake install

Included Plugins
----------------
The following plugins are installed

* Ack.vim
* Fuzzy Finder/Fuzzy Finder TextMate
* gist.vim
* jquery.vim
* NERDcommenter
* NERDtree
* snipmate (and tons of extra snippets)
* taglist.vim
* vim-align
* vim-endwise
* vim-fugitive
* vim-git
* vim-liquid
* vim-markdown
* vim-pathogen.vim *REQUIRED*
* vim-rails
* vim-ruby

