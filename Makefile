.DEFAULT_GOAL := help

PARTS = \
	agignore ctags direnvrc gemrc gitconfig gitignore hushlogin \
	icalBuddyConfig.plist inputrc irbrc irb.d my.cnf psqlrc rgignore \
	ruby-version screenrc tmux.d tmux.conf vim zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))

install: $(LINKS) ## install all dotfiles to $HOME
.PHONY: install

setup-raspberry-pi: ## setup dotfiles for a Raspberry Pi
	ln -s gitconfig $(HOME)/.gitconfig
	ln -s inputrc $(HOME)/.inputrc
	ln -s vim $(HOME)/.vim
	share/linux/scripts/rpi-init.sh
.PHONY: setup-raspberry-pi

uninstall: ## uninstall dotfiles (if they are symlinks)
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done
.PHONY: uninstall

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@

help: ## show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
