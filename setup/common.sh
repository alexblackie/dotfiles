#!/bin/bash

echo "    * Change to ZSH"
chsh -s /bin/zsh

echo "    * Symlinking everything..."

cd ~/.dotfiles/
git submodule init
git submodule update
mkdir ~/.config
ln -s ~/.dotfiles/.oh-my-zsh ~/.oh-my-zsh
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.commonrc ~/.commonrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.fonts.conf ~/.fonts.conf
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.vim ~/.vim
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.gemrc ~/.gemrc
ln -s ~/.dotfiles/.ruby-version ~/.ruby-version
ln -s ~/.dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/.Xresources ~/.Xresources
ln -s ~/.dotfiles/.irssi ~/.irssi
