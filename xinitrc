#!/usr/bin/env zsh
setxkbmap -option caps:escape &
xset r rate 220 34 &
sh ~/.fehbg &
/usr/bin/xscreensaver -no-splash &
xrdb -load ~/.Xresources &
/usr/bin/start-pulseaudio-x11 &
exec i3
