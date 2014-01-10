#!/bin/bash

# ------------------------------------------------------------------------------
# Fresh computer setup: OSX
# ------------------------------------------------------------------------------

echo
echo "    * Setting up sane default preferences..."
# No long-ass window-opening animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Quicker resizes in Cocoa apps
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Expand save dialogues by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# I know when I've downloaded something, don't bug me about it
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Duck autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Enable quitting for finder
defaults write com.apple.finder QuitMenuItem -bool true

# I'm a professional, I don't care about your fucking animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Show hidden files, too
defaults write com.apple.Finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show statusbar
defaults write com.apple.finder ShowStatusBar -bool true

# Don't warn when changing a filename extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Text-selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# No .DS_Store shits on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Show the Library, goddammit
chflags nohidden ~/Library

# Don't verify volumes when mounting
defaults write com.apple.frameworks.diskimages skip-verify -bool true

# Enable develop menu in Safari
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

# Web inspector in embedded webkit
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Fuck Time Machine and it's annoying popups
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Airdrop over ethernet
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Don't confirm trash emptying
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Tap-to-click, everywhere
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Fastest key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Dashboard as an overlay
defaults write com.apple.dock "dashboard-in-overlay" -bool true

# Map top-left screen corner to Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0


# Dotfiles
bash common.sh

echo "    * Installing Homebrew"
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

echo "    * Installing some things from Homebrew"
brew install tmux cmus wget git ruby-install chruby

echo "    * Setting up Ruby"
source ~/.zshrc
ruby-install ruby stable

echo "Everything should be good-to-go!"
echo
