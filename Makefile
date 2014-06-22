setup:
	git submodule init
	git submodule update

clean:
	rm -rf ~/.zshrc
	rm -rf ~/.oh-my-zsh
	rm -rf ~/.commonrc
	rm -rf ~/.gitconfig
	rm -rf ~/.tmux.conf
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.gemrc
	rm -rf ~/.ruby-version
	rm -rf ~/.gitignore_global

linuxclean:
	rm -rf ~/.config/fontconfig/fonts.conf
	rm -rf ~/.Xresources

osxclean:
	rm -rf ~/.tmux-osx.conf

install:
	cp    ./zshrc            ~/.zshrc
	cp -r ./oh-my-zsh        ~/.oh-my-zsh
	cp    ./commonrc         ~/.commonrc
	cp    ./gitconfig        ~/.gitconfig
	cp    ./tmux.conf        ~/.tmux.conf
	cp -r ./vim              ~/.vim
	cp    ./vimrc            ~/.vimrc
	cp    ./gemrc            ~/.gemrc
	cp    ./ruby-version     ~/.ruby-version
	cp    ./gitignore_global ~/.gitignore_global

linuxinstall:
	mkdir -p ~/.config/fontconfig ~/.config/terminator
	cp ./fonts.conf  ~/.config/fontconfig/fonts.conf
	cp ./Xresources  ~/.Xresources
	cp ./config/terminator/config ~/.config/terminator/config

osxinstall:
	chflags nohidden ~/Library
	defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
	defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
	defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
	defaults write com.apple.LaunchServices LSQuarantine -bool false
	defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
	defaults write com.apple.finder QuitMenuItem -bool true
	defaults write com.apple.finder DisableAllAnimations -bool true
	defaults write com.apple.Finder AppleShowAllFiles -bool true
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	defaults write com.apple.finder ShowStatusBar -bool true
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	defaults write com.apple.finder QLEnableTextSelection -bool true
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.frameworks.diskimages skip-verify -bool true
	defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
	defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
	defaults write com.apple.finder WarnOnEmptyTrash -bool false
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
	defaults write NSGlobalDomain KeyRepeat -int 0
	defaults write com.apple.dock "dashboard-in-overlay" -bool true
	defaults write com.apple.dock wvous-tl-corner -int 2
	defaults write com.apple.dock wvous-tl-modifier -int 0
	defaults write -g NSScrollViewRubberbanding -int 0
	cp ./tmux-osx.conf ~/.tmux-osx.conf
