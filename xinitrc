#!/usr/bin/env zsh
setxkbmap -option caps:escape &
xset r rate 220 34 &
nm-applet &
sh ~/.fehbg &
/usr/bin/xscreensaver -no-splash &
exec i3
