setup:
	git submodule init
	git submodule update

clean:
	rm -rf ~/.zshrc
	rm -rf ~/.zsh
	rm -rf ~/.commonrc
	rm -rf ~/.gitconfig
	rm -rf ~/.tmux.conf
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.gemrc
	rm -rf ~/.ruby-version
	rm -rf ~/.gitignore_global
	rm -rf ~/.agignore
	rm -rf ~/.webshots
	rm -rf ~/.config/htop
	rm -rf ~/.config/fontconfig/fonts.conf
	rm -rf ~/.Xresources
	rm -rf ~/.i3
	rm -rf ~/.i3status.conf
	rm -rf ~/.xinitrc
	rm -rf ~/.fehbg

osxclean:
	rm -rf ~/.tmux-osx.conf

install:
	cp    ./zshrc            ~/.zshrc
	cp -r ./zsh              ~/.zsh
	cp    ./commonrc         ~/.commonrc
	cp    ./gitconfig        ~/.gitconfig
	cp    ./tmux.conf        ~/.tmux.conf
	cp -r ./vim              ~/.vim
	cp    ./vimrc            ~/.vimrc
	cp    ./gemrc            ~/.gemrc
	cp    ./ruby-version     ~/.ruby-version
	cp    ./gitignore_global ~/.gitignore_global
	cp    ./agignore         ~/.agignore
	cp -r ./webshots         ~/.webshots
	cp -r ./config/htop      ~/.config/htop
	mkdir -p ~/.config/fontconfig
	cp    ./fonts.conf               ~/.config/fontconfig/fonts.conf
	cp    ./Xresources               ~/.Xresources
	mkdir -p ~/.config/terminator
	cp    ./config/terminator/config ~/.config/terminator/config
	cp -r ./i3                       ~/.i3
	cp    ./i3status.conf            ~/.i3status.conf
	cp    ./xinitrc                  ~/.xinitrc
	cp    ./fehbg                    ~/.fehbg

osxinstall:
	cp ./tmux-osx.conf ~/.tmux-osx.conf
