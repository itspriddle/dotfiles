DOTFILES = $(shell pwd)

.PHONY: install default

default:
	@echo 'Run `make install` to install dotfiles'

install:
	@ln -nfs $(DOTFILES)/agignore ~/.agignore
	@ln -nfs $(DOTFILES)/bash ~/.bash
	@ln -nfs $(DOTFILES)/bash_profile ~/.bash_profile
	@ln -nfs $(DOTFILES)/bashrc ~/.bashrc
	@ln -nfs $(DOTFILES)/gemrc ~/.gemrc
	@ln -nfs $(DOTFILES)/gitconfig ~/.gitconfig
	@ln -nfs $(DOTFILES)/gitignore ~/.gitignore
	@ln -nfs $(DOTFILES)/gvimrc ~/.gvimrc
	@ln -nfs $(DOTFILES)/hushlogin ~/.hushlogin
	@ln -nfs $(DOTFILES)/inputrc ~/.inputrc
	@ln -nfs $(DOTFILES)/irb.d ~/.irb.d
	@ln -nfs $(DOTFILES)/irbrc ~/.irbrc
	@ln -nfs $(DOTFILES)/my.cnf ~/.my.cnf
	@ln -nfs $(DOTFILES)/powconfig ~/.powconfig
	@ln -nfs $(DOTFILES)/profile.d ~/.profile.d
	@ln -nfs $(DOTFILES)/psqlrc ~/.psqlrc
	@ln -nfs $(DOTFILES)/railsrc ~/.railsrc
	@ln -nfs $(DOTFILES)/screenrc ~/.screenrc
	@ln -nfs $(DOTFILES)/tmux.conf ~/.tmux.conf
	@ln -nfs $(DOTFILES)/vim ~/.vim
	@ln -nfs $(DOTFILES)/vimrc ~/.vimrc
	@ln -nfs $(DOTFILES)/zprofile ~/.zprofile
	@ln -nfs $(DOTFILES)/zsh ~/.zsh
	@ln -nfs $(DOTFILES)/zshenv ~/.zshenv
	@ln -nfs $(DOTFILES)/zshrc ~/.zshrc
