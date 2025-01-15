#!/bin/bash

if [[ $* == *extern* ]]; then
  xrandr --output HDMI-1 --mode 2560x1440 --primary --output eDP-1 --off
elif [[ $* == *laptop* ]]; then
  xrandr --output eDP-1 --mode 1920x1200 --primary --output HDMI-1 --off
else
  xrandr --output HDMI-1 --mode 2560x1440 --primary --left-of eDP-1 --output eDP-1 --mode 1920x1200
fi

feh --bg-fill ~/pics/wallpaper/blue_green.png
