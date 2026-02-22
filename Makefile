.DEFAULT_GOAL := help

PARTS = \
	agignore ctags direnvrc gemrc gitconfig gitignore hushlogin \
	icalBuddyConfig.plist inputrc irbrc irb.d my.cnf psqlrc rgignore \
	ruby-version screenrc tmux.d tmux.conf vim zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))
PREFIX ?= /usr/local

##@ Setup

.PHONY: install
install: $(LINKS) ## Install all dotfiles to $HOME

.PHONY: uninstall
uninstall: ## Uninstall dotfiles (if they are symlinks)
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

.PHONY: install-opt
install-opt: ## Install binaries from opt/PACKAGE/bin/* to PREFIX/bin
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

.PHONY: uninstall-opt
uninstall-opt: ## Uninstall binaries from PREFIX/bin for opt/PACKAGE/bin/*
	$(eval PACKAGE := $(or $(NAME),$(filter-out uninstall-opt,$(MAKECMDGOALS))))
	@if [ -z "$(PACKAGE)" ]; then \
		echo "Error: Package name required. Usage: make uninstall-opt PACKAGE or make uninstall-opt NAME=PACKAGE"; \
		exit 1; \
	fi
	@if [ ! -d "opt/$(PACKAGE)/bin" ]; then \
		echo "Error: opt/$(PACKAGE)/bin directory not found"; \
		exit 1; \
	fi
	@for f in opt/$(PACKAGE)/bin/*; do \
		target="$(PREFIX)/bin/$$(basename $$f)"; \
		if [ -L "$$target" ]; then \
			rm -vf "$$target"; \
		fi; \
	done

##@ Code Quality

.PHONY: test
test: ## Run shellcheck on shell scripts
	gh shellcheck -e SC1090,SC1091 -- :tmux.d :opt/graveyard :bash/git-prompt.sh

##@ Info

# Prevent make from treating package names as targets
%:
	@:

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } \
		/^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
