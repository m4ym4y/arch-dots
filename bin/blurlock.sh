#!/bin/bash

scrot -o /tmp/blurlock_original.png
convert /tmp/blurlock_original.png -blur 0x4 /tmp/blurlock_blur.png
i3lock -i /tmp/blurlock_blur.png
