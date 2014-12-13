EXCLUDES := configs/. configs/..
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard configs/.*))

setup:
	git submodule init
	git submodule update

clean:
	echo "You should probably fix this!"

install:
	cp -Rfv $(DOTFILES) ${HOME}
