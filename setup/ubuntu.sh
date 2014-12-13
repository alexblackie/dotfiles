#!/bin/bash

####
##  Un-Fuck Ubuntu
####

main() {

  # Remove Lenses and Social Accounts because we're professionals, dammit!
  sudo apt-get remove -y unity-scope-virtualbox unity-scope-yelp \
                         unity-scope-zotero unity-scope-texdoc unity-scope-tomboy \
                         unity-scope-video-remote unity-scope-musicstores \
                         unity-scope-musique unity-scope-openclipart \
                         unity-scope-manpages unity-scope-guayadeque \
                         unity-scope-gdrive unity-scope-gmusicbrowser \
                         unity-scope-gourmet unity-scope-colourlovers \
                         unity-scope-devhelp unity-scope-firefoxbookmarks \
                         unity-scope-chromiumbookmarks unity-scope-clementine \
                         unity-lens-friends unity-scope-audacious \
                         unity-scope-calculator account-plugin-aim \
                         account-plugin-jabber account-plugin-salut \
                         account-plugin-yahoo account-plugin-twitter \
                         account-plugin-windows-live account-plugin-flickr \
                         account-plugin-google account-plugin-facebook

  # Install updates
  sudo apt-get update && sudo apt-get dist-upgrade -y

  # Install some key tools/software
  sudo apt-get install -y zsh vim tmux git pass virtualbox gnome-tweak-tool \
                          rxvt-unicode xclip nodejs-legacy libxslt-dev \
                          libxml2-dev openssh-server

}; main
