.DEFAULT_GOAL := help

PARTS = \
	agignore ctags gemrc gitconfig gitignore hushlogin inputrc irbrc irb.d \
	my.cnf profile.d psqlrc rgignore ruby-version vim zsh zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))

.PHONY: backup force-uninstall install uninstall help

backup: ## backup all dotfiles
	mkdir -p .backups
	-tar -C $(HOME) -zcf .backups/dotfiles-`date +%s`.tar.gz $(addprefix ., $(PARTS))

force-uninstall: backup ## forcefully uninstall all dotfiles (even if they aren't symlinks)
	rm -vfR $(LINKS)

install: $(LINKS) ## install all dotfiles to $HOME

setup-raspberry-pi:
	ln -s gitconfig $(HOME)/.gitconfig
	ln -s inputrc $(HOME)/.inputrc
	ln -s vim $(HOME)/.vim
	share/linux/scripts/rpi-init.sh
.PHONY: setup

uninstall: ## uninstall dotfiles (if they are symlinks)
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@

help: ## show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
