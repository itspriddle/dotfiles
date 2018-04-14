PARTS = \
	agignore ctags gemrc gitconfig gitignore hushlogin inputrc irbrc irb.d \
	my.cnf profile.d psqlrc rgignore ruby-version vim zsh zshenv zshrc

LINKS = $(addprefix $(HOME)/., $(PARTS))

.PHONY: default backup force-uninstall install uninstall

default:
	@echo 'Run `make install` to install dotfiles'

backup:
	mkdir -p .backups
	-tar -C $(HOME) -zcf .backups/dotfiles-`date +%s`.tar.gz $(addprefix ., $(PARTS))

force-uninstall: backup
	rm -vfR $(LINKS)

install: $(LINKS)

uninstall:
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

$(LINKS):
	ln -s $(abspath $(@:$(HOME)/.%=%)) $@
