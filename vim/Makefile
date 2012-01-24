help:
# @echo "make install        - Install everything"
	@echo "make update         - Update everything"
	@echo "make update-plugins - Update bundled plugins"
	@echo "make update-help    - Update help for bundled plugins"
	@echo "make clean          - Cleanup everything"
	@echo "make clean-backups  - Cleanup ~/.vim/backups"
	@echo "make clean-views    - Cleanup ~/.vim/views"

# install:
# 	@ln -s ${PWD}/vim ${HOME}/.vim
# 	@ln -s ${PWD}/gvimrc ${HOME}/.gvimrc
# 	@ln -s ${PWD}/vimrc ${HOME}/.vimrc

update: update-plugins update-help

update-help:
	@vim -e -c 'Helptags|q' 2>&1 /dev/null

update-plugins:
	@git submodule foreach 'git checkout master; git pull'

clean: clean-backup clean-view

clean-backup:
	@rm -f ~/.vim/.backup/*

clean-view:
	@rm -f ~/.vim/.view/*
