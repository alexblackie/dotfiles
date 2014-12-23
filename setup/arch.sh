#!/bin/bash

                               #**** DRAFT ****#

################################################################################
##                       Alex's Arch Linux Bootstrapper                       ##
################################################################################

# This script is meant to be executed on initial chroot -- it performs
# *everything* related to system setup after `pacstrap`. Simply `curl` this
# file to the system, run it, and then reboot into the newly configured system.
#
# This script assumes the installation of `base` and `base-devel` already.
#
# ---
#
# Everyone uses computers differently, and that's what is so great about Arch:
# you can set it up basically any way you want. But, that comes at a price;
# with great freedom comes a great amount of work. This script is how *I* set
# up Arch Linux, and reflects the way *I* prefer to do things. I mean this to
# only be an inspiration or helpful resource, not as a source of truth on how
# one should configure their system. A lot of opinions and decisions went into
# this, so unless you work exactly the same way I do, this will probably bring
# some annoyances with it.
#
# That said, I hope that it will be of use for someone other than me at some
# point in the future.

##------------------------
# CONFIGURATION VARIABLES
##------------------------

# Software
INSTALL_CMD="pacman -S --noconfirm"

# System
IS_EFI=true
ROOT_PARTITION=/dev/sda2
BIOS_DRIVE=/dev/sda # Only used if IS_EFI=false

# User
TIMEZONE=America/Vancouver
HOSTNAME=buttsnatcher.forest.lan
USERNAME=alex


##----------------
# EXECUTION STEPS
##----------------
main() {
  configure_system

  install_x
  install_desktop
  install_development_tools
  install_applications

  configure_gnome
  configure_dotfiles
}

##
# This configures the base system, following many of the steps outlined in the
# Installation Guide on the Arch Wiki.
configure_system() {
  # Set locale
  echo "LANG=en_US.UTF-8" > /etc/locale.conf
  sed -i "s/\#en_US\.UTF\-8/en_US\.UTF\-8/" /etc/locale.gen
  locale-gen

  # Set clock/timezone
  ln -s /usr/share/zoneinfo/$TIMEZONE /etc/localtime
  hwclock --systohc --utc

  # Set a hostname
  echo $HOSTNAME > /etc/hostname

  # Root Password
  echo "** SETTING PASSWORD FOR ROOT **"
  passwd

  # Add user
  useradd -m -g users -G wheel -s /bin/zsh $USERNAME

  echo "** SETTING PASSWORD FOR $USERNAME **"
  passwd $USERNAME

  # Bootloader; installs Gummiboot for EFI, GRUB for legacy
  if $IS_EFI ; then
    $INSTALL_CMD gummiboot
    gummiboot install
    echo "title Arch Linux\nlinux /vmlinux-linux\n/initramfs-linux.img\noptions root=$ROOT_PARTITION rw" > /boot/loader/entries/arch.conf
  else
    $INSTALL_CMD grub
    grub-install --target=i386-pc --recheck $BIOS_DRIVE
    grub-mkconfig -i /boot/grub/grub.cfg
  fi
}

##
# Installs X11 (all of it because I'm too lazy to sort through all the hundreds
# of packages).
install_x() {
  $INSTALL_CMD xorg
}

##
# Installs the i3 window manager, LightDM login manager, and some related tools.
install_desktop() {
  $INSTALL_CMD i3 xscreensaver terminus-font numix-themes lxappearance \
               networkmanager network-manager-applet lightdm \
               lightdm-gtk2-greeter pulseaudio dmenu feh
  systemctl enable lightdm
}

##
# Installs my favourite set of development tools.
install_development_tools() {
  $INSTALL_CMD zsh tmux git vagrant virtualbox nodejs rxvt-unicode \
               the_silver_searcher vim ack
}

##
# Install some other applications and tools.
install_applications() {
  # General
  $INSTALL_CMD scrot openssh xclip pass gnupg nmap thunderbird gimp pavucontrol

  # AUR apps (have to be built as non-root)
  su -c install_applications_as_user $USERNAME
}
install_applications_as_user() {
  mkdir ~/src
  cd ~/src

  # Google Chrome
  curl -LO https://aur.archlinux.org/packages/go/google-chrome/google-chrome.tar.gz
  tar -xzf google-chrome.tar.gz && cd google-chrome
  makepkg -s --noconfirm
  sudo pacman -U *.tar.xz

  exit
}

##
# Configure GNOME 3 settings
configure_gnome() {
  # Remap CapsLock to Escape
  gsettings set org.gnome.desktop.input-sources.xkb-options caps:escape

  # Show date in menubar
  gsettings set org.gnome.desktop.interface clock-show-date true
}

##
# Configure dotfiles
configure_dotfiles() {
  su -c configure_dotfiles_as_user $USERNAME
}
configure_dotfiles_as_user() {
  git clone https://github.com/alexblackie/dotfiles.git ~/.dotfiles
  cd ~/.dotfiles
  git submodule init
  git submodule update
  make install
}

##
# Self-execute
main
