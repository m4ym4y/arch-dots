#!/bin/bash
sleep_pid=0

rerun() {
  if [ "$sleep_pid" -ne 0 ]; then
    echo $(expr $RANDOM % 20 + 1)
    kill $sleep_pid &>/dev/null
  fi
}

trap "rerun" USR1

echo d20
while true; do
  bash -c "sleep 3 && echo d20 && sleep infinity" &
  sleep_pid=$!
  wait
done
