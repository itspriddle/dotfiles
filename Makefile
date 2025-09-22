.DEFAULT_GOAL := help

PARTS = \
	agignore ctags direnvrc gemrc gitconfig gitignore hushlogin \
	icalBuddyConfig.plist inputrc irbrc irb.d my.cnf psqlrc rgignore \
	ruby-version screenrc tmux.d tmux.conf vim zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))
PREFIX ?= /usr/local

install: $(LINKS) ## install all dotfiles to $HOME
.PHONY: install

uninstall: ## uninstall dotfiles (if they are symlinks)
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done
.PHONY: uninstall

install-opt: ## install binaries from opt/PACKAGE/bin/* to PREFIX/bin (usage: make install-opt PACKAGE or make install-opt NAME=PACKAGE)
	$(eval PACKAGE := $(or $(NAME),$(filter-out install-opt,$(MAKECMDGOALS))))
	@if [ -z "$(PACKAGE)" ]; then \
		echo "Error: Package name required. Usage: make install-opt PACKAGE or make install-opt NAME=PACKAGE"; \
		exit 1; \
	fi
	@if [ ! -d "opt/$(PACKAGE)/bin" ]; then \
		echo "Error: opt/$(PACKAGE)/bin directory not found"; \
		exit 1; \
	fi
	@mkdir -p $(PREFIX)/bin
	@if [ -n "$$(ls -A opt/$(PACKAGE)/bin/ 2>/dev/null)" ]; then \
		ln -sf $(abspath opt/$(PACKAGE))/bin/* $(PREFIX)/bin/; \
	else \
		echo "No files found in opt/$(PACKAGE)/bin/"; \
	fi
.PHONY: install-opt

test:
	gh shellcheck -e SC1090,SC1091 -- :tmux.d :opt/graveyard :bash/git-prompt.sh
.PHONY: test

# Prevent make from treating package names as targets
%:
	@:

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@

help: ## show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
