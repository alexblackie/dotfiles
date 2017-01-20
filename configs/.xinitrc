#!/bin/sh

export DE=gnome

# Force load Xresources, sometimes it doesn't autoload for some reason
xrdb -load ~/.Xresources

# Xmodmap!
xmodmap ~/.Xmodmap &

# Fix keyboard
resetkeyboard &

# Start pulseaudio
start-pulseaudio-x11 &

# Set background
sh ~/.fehbg &

# Start redshift-gtk to save my eyes
redshift-gtk &

# Launch i3 with dbus support
exec dbus-launch i3
