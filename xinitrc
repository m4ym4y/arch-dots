#!/bin/bash

PATH="$PATH:$HOME/.local/bin"

setxkbmap -option "caps:none"
feh --bg-fill ~/pics/wallpaper/blue_green.png
~/bin/bar.sh &

while true; do
  dwm 2> ~/.dwm.log
done
