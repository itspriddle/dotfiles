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

Oh, you probably will need Vim 7.3, either console or MacVim.

# Setup and Maintenance

I use [pathogen.vim](https://github.com/tpope/vim-pathogen/) and [git
submodules](http://www.kernel.org/pub/software/scm/git/docs/git-submodule.html)
to handle third party plugins. All plugins are kept in the default location
for pathogen, `vim/bundle/`. A Makefile is included to update plugins and
their helptags.

Where it makes sense, settings are kept in `vim/plugin/settings/`. I might
merge these back into `vimrc` at some point.

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

## Cleaning Backups and Views

`~/.vim/.backup/` and `~/.vim/.view/` may need to be cleaned up from time to
time:

    cd ~/.vim
    make clean-backup
    make clean-view
    make clean # runs both clean-backup and clean-view

# Plugins and Customizations

See [vim/plugin/settings/](http://git.io/bhf9Jg) for a list of installed
plugins.

## Included Plugins

See [vim/bundle/](http://git.io/cWGCAQ) for a list of installed plugins.
