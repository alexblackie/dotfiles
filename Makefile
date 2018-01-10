EXCLUDES := configs/. configs/..
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard configs/.*))

install:
	git submodule update --init
	cp -Rfv $(DOTFILES) ${HOME}
	cp -Rfv bin/* ${HOME}/bin

dconfdump:
	dconf dump /org/gnome/terminal/legacy/ > ./configs/gnome-terminal.ini
	dconf dump /org/gnome/shell/extensions/ > ./configs/gnome-extensions.ini

dconf:
	dconf load /org/gnome/terminal/legacy/ < ./configs/gnome-terminal.ini
	dconf load /org/gnome/shell/extensions/ < ./configs/gnome-extensions.ini
