# ------------------------------------------------------------------------------
# Fresh computer setup: Arch Linux
# ------------------------------------------------------------------------------

sudo pacman -Syy
sudo pacman -Syu

sudo pacman -S wget curl tmux vim gnome firefox keepassx urxvt

echo "    * Setting up Ruby..."
mkdir -p ~/src
cd ~/src

wget -O chruby-0.3.8.tar.gz https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz
tar -xzvf chruby-0.3.8.tar.gz
cd chruby-0.3.8/
sudo make install

wget -O ruby-install-0.3.4.tar.gz https://github.com/postmodern/ruby-install/archive/v0.3.4.tar.gz
tar -xzvf ruby-install-0.3.4.tar.gz
cd ruby-install-0.3.4/
sudo make install

source ~/.zshrc

ruby-install ruby stable
