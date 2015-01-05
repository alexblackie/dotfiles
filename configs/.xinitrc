#!/usr/bin/env zsh
xrdb -load ~/.Xresources &
exec dbus-launch i3
