#!/usr/bin/env zsh
setxkbmap -option caps:escape &
xset r rate 220 34 &
nm-applet &
exec i3
