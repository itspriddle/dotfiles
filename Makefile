DOTFILES = $(shell pwd)

.PHONY: install default

default:
	@echo 'Run `make install` to install dotfiles'

install:
	@ln -s $(DOTFILES)/agignore ~/.agignore
	@ln -s $(DOTFILES)/bash ~/.bash
	@ln -s $(DOTFILES)/bash_profile ~/.bash_profile
	@ln -s $(DOTFILES)/bashrc ~/.bashrc
	@ln -s $(DOTFILES)/gemrc ~/.gemrc
	@ln -s $(DOTFILES)/gitconfig ~/.gitconfig
	@ln -s $(DOTFILES)/gitignore ~/.gitignore
	@ln -s $(DOTFILES)/gvimrc ~/.gvimrc
	@ln -s $(DOTFILES)/hushlogin ~/.hushlogin
	@ln -s $(DOTFILES)/inputrc ~/.inputrc
	@ln -s $(DOTFILES)/irb.d ~/.irb.d
	@ln -s $(DOTFILES)/irbrc ~/.irbrc
	@ln -s $(DOTFILES)/my.cnf ~/.my.cnf
	@ln -s $(DOTFILES)/powconfig ~/.powconfig
	@ln -s $(DOTFILES)/profile.d ~/.profile.d
	@ln -s $(DOTFILES)/psqlrc ~/.psqlrc
	@ln -s $(DOTFILES)/railsrc ~/.railsrc
	@ln -s $(DOTFILES)/screenrc ~/.screenrc
	@ln -s $(DOTFILES)/tmux.conf ~/.tmux.conf
	@ln -s $(DOTFILES)/vim ~/.vim
	@ln -s $(DOTFILES)/vimrc ~/.vimrc
	@ln -s $(DOTFILES)/zprofile ~/.zprofile
	@ln -s $(DOTFILES)/zsh ~/.zsh
	@ln -s $(DOTFILES)/zshenv ~/.zshenv
	@ln -s $(DOTFILES)/zshrc ~/.zshrc
