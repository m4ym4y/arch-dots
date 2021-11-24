#!/bin/bash
sleep_pid = 0

rerun() {
  if [ "$sleep_pid" -ne 0 ]; then
    kill $sleep_pid &>/dev/null
  fi
}

trap "rerun" USR1

while true; do
  8ball
  sleep $1 &
  sleep_pid=$!
  wait
done
