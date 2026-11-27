.DEFAULT_GOAL := help

PARTS = \
	ctags direnvrc gitconfig gitignore hushlogin inputrc rgignore screenrc \
	tmux.d tmux.conf vim/vimrc zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))
PREFIX ?= /usr/local

##@ Setup

.PHONY: install
install: $(LINKS) ## Install all dotfiles to $HOME

.PHONY: uninstall
uninstall: ## Uninstall dotfiles (if they are symlinks)
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

##@ Code Quality

.PHONY: test
test: test-shellcheck ## Run all tests

.PHONY: test-shellcheck
test-shellcheck: ## Run shellcheck on shell scripts
	gh shellcheck -e SC1090,SC1091 -- :tmux.d :opt/graveyard :bash/git-prompt.sh :bash/completion.d/ :bash/plugins/

.PHONY: test-shfmt
test-shfmt: ## Run shfmt on shell scripts
	gh shfmt -- :tmux.d :opt/graveyard :bash/git-prompt.sh :bash/completion.d/ :bash/plugins/

.PHONY: fmt-shfmt
fmt-shfmt: ## Run shfmt -w on shell scripts
	gh shfmt -w -- :tmux.d :opt/graveyard :bash/git-prompt.sh :bash/completion.d/ :bash/plugins/

##@ Info

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@

.PHONY: help
help: ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } \
		/^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
