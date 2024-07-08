#!/bin/bash

show_battery() {
  acpi | awk '{ print substr($4, 1, length($4) - 1) }'
}

show_date() {
  date +'%Y-%b-%d %I:%M.%S'
}

while [ 1 ]; do
  xsetroot -name "[🔋 $(show_battery)] [📅 $(show_date)]"
  sleep 1
done
