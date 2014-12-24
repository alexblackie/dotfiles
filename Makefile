EXCLUDES := configs/. configs/..
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard configs/.*))

install:
	cp -Rfv $(DOTFILES) ${HOME}
	cp -Rfv bin/* ${HOME}/bin
