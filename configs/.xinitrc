#!/usr/bin/env zsh

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

# Fix trackpoint
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.75

# Launch i3 with dbus support
exec dbus-launch i3
