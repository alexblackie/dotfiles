DOTFILES=$(wildcard configs/.*)

setup:
	git submodule init
	git submodule update

clean:
	echo "You should probably fix this!"

install:
	cp -Rfv $(DOTFILES) ${HOME}
