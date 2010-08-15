vim smackdown
=============

My (g)vim configurations. It uses Tim Pope's
[vim-pathogen](http://github.com/tpope/vim-pathogen) and
[git submodules](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html)
to keep things relatively tidy.

Installation
------------

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

Included Plugins
----------------

The following plugins are installed in `vim/bundle/`

* [Ack.vim](http://github.com/mileszs/ack.vim)
* [Command-T](http://github.com/wincent/Command-T)
* [Fuzzy Finder/Fuzzy Finder TextMate](http://github.com/itspriddle/vim-fuzzyfinder-pathogen)
* [gist.vim](http://github.com/mattn/gist-vim)
* [jslint.vim](http://github.com/itspriddle/vim-jslint)
* jquery.vim
* [NERDtree](http://github.com/scrooloose/nerdtree)
* [snipmate](http://github.com/msanders/snipmate.vim) (and tons of [extra snippets](http://github.com/scrooloose/snipmate-snippets))
* [taglist.vim](http://github.com/esukram/taglist.vim)
* [vim-align](http://github.com/tsaleh/vim-align)
* [vim-coffee-script](http://github.com/kchmck/vim-coffee-script)
* [vim-endwise](http://github.com/tpope/vim-endwise)
* [vim-fugitive](http://github.com/tpope/vim-fugitive)
* [vim-git](http://github.com/tpope/vim-git)
* [vim-javascript-indent](http://github.com/itspriddle/vim-javascript-indent)
* [vim-lesscss](http://github.com/itspriddle/vim-lesscss)
* [vim-liquid](http://github.com/tpope/vim-liquid)
* [vim-markdown](http://github.com/tpope/vim-markdown)
* [vim-markdown-preview](http://github.com/robgleeson/vim-markdown-preview)
* [vim-openser](http://github.com/itspriddle/vim-openser)
* [vim-pathogen](http://github.com/tpope/vim-pathogen) *REQUIRED*
* [vim-rails](http://github.com/tpope/vim-rails)
* [vim-rename](http://github.com/itspriddle/vim-rename)
* [vim-ruby](http://github.com/vim-ruby/vim-ruby)
* [vim-tcomment](http://github.com/tsaleh/vim-tcomment)
