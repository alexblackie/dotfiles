EXCLUDES := configs/. configs/..
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard configs/.*))

install:
	git submodule update --init
	cp -Rfv $(DOTFILES) ${HOME}
	cp -Rfv bin/* ${HOME}/bin
