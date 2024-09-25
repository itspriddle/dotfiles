PREFIX ?= /usr/local
BINS := `find "$(CURDIR)" -type f -path "*/bin/*"`
OPT_DIR := $(shell dirname "$(realpath $(firstword $(MAKEFILE_LIST)))")

# INSTALL_FILES = $(addprefix $(PREFIX)/, $(BINS))

.PHONY: help
help: ## show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## symlink all opt bins to /usr/local/bin
	@echo "Installing files to $(PREFIX)/bin"
	@for file in $(BINS); do \
		echo "  $$(basename "$$file")"; \
		ln -sf $$file $(PREFIX)/bin/; \
	done

.PHONY: uninstall
uninstall: ## remove all opt symlinks from /usr/local/bin
	@echo "Removing files from $(PREFIX)/bin"
	@for file in $(BINS); do \
		echo "  $$(basename "$$file")"; \
		rm -f "$(PREFIX)/bin/$$(basename "$$file")"; \
	done
