#!/usr/bin/env zsh

export DE=gnome

# Force load Xresources, sometimes it doesn't autoload for some reason
xrdb -load ~/.Xresources

# Xmodmap!
xmodmap ~/.Xmodmap &

# Fix keyboard
resetkeyboard &

# Start xscreensaver
xscreensaver &

# Start pulseaudio
start-pulseaudio-x11 &

# Set background
sh ~/.fehbg &

# Launch i3 with dbus support
exec dbus-launch i3
