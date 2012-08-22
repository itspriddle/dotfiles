manifest = \
	ackrc \
	bash \
	bash_profile \
	bashrc \
	capistrano \
	caprc \
	gemrc \
	gitconfig \
	gitignore \
	hushlogin \
	inputrc \
	irbrc \
	irbrc-rails \
	powconfig \
	zsh \
	zshenv \
	zshrc

install: deps
	@for file in $(manifest); do \
		[ -f $$HOME/.$$file ] && unlink $$HOME/.$$file ; \
		ln -s "$$PWD/$$file" "$$HOME/.$$file" ; \
	done

deps:

.PHONY: all
