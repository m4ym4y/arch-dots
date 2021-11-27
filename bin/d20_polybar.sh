#!/bin/bash

roll() {
  echo $(expr $RANDOM % 20 + 1)
}

write20() {
  echo "20"
}

trap "roll" USR1
trap "write20" HUP

write20
while true; do
  sleep infinity &
  wait
done
