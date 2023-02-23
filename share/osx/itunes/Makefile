.DEFAULT_GOAL := help

.PHONY: backup install help

LIVE_EQ_PATH=$(HOME)/Library/Preferences/com.apple.Music.eq.plist

backup: ## backup live eq settings to this repo
	cp -f "$(LIVE_EQ_PATH)" .

install: ## install eq settings
	cp -f com.apple.Music.eq.plist "$(LIVE_EQ_PATH)" .
	@echo 'You MUST reboot for the settings to take effect!'

help: ## show this help text
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN { FS = ":.*?## " }; { printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 }'
