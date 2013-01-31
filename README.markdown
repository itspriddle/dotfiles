# Josh's Vim Config

My Vim config, which I think is better than yours.

Maybe it's not. Much of it has come from other developers' settings I've seen
on the web, so maybe I've stolen something from you.

I work primarily with Ruby, Javascript, Markdown, HTML, and CSS, so my setup
is somewhat specific to those languages (and libraries/frameworks written with
them).

This repo changes pretty frequently as my tastes change or I
install a plugin that scratches a new itch. I've tried to keep things
commented as much as possible.

Oh, you will need Vim 7.3, either console or MacVim. A shell script is
included at [`share/install-vim.sh`](share/install-vim.sh) to help install
console Vim. For MacVim, try [b4winkler/macvim](http://git.io/2d9SNA) or
[Homebrew](http://git.io/homebrew).

# Setup and Maintenance

I use [pathogen.vim](https://github.com/tpope/vim-pathogen/) and [git
submodules](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html)
to handle third party plugins. All plugins are kept in the default location
for pathogen, `~/.vim/bundle/`. A Makefile is included to update plugins and
their helptags.

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

## Updating Plugins and Helptags

Update all plugins installed as git submodules and runs `:Helptags` to make
Vim aware of their help documents:

    cd ~/.vim
    make update-plugins
    make update-help
    make update # runs both update-plugins and update-help

## Included Plugins

See [`bundle/`](bundle) for a list of installed plugins.
