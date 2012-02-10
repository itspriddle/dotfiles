help:
# @echo "make install        - Install everything"
	@echo "make update         - Update everything"
	@echo "make update-plugins - Update bundled plugins"
	@echo "make update-help    - Update help for bundled plugins"
	@echo "make clean          - Cleanup everything"

# install:
# 	@ln -s ${PWD}/vim ${HOME}/.vim
# 	@ln -s ${PWD}/gvimrc ${HOME}/.gvimrc
# 	@ln -s ${PWD}/vimrc ${HOME}/.vimrc

# Update plugins then help
update: update-plugins update-help

# Update helptags for pathogen
update-help:
	@vim -e -c 'silent Helptags|q' 2>&1 /dev/null

# Update all git submodules
update-plugins:
	@git submodule foreach 'git checkout master; git pull'

# Cleanp backup/view dirs
clean:
	@rm -f ~/.vim/.tmp/*/*
