#!/bin/bash
function blinky {
  ~/Projects/blinky/blinky-tape-tool $@
}

function solid {
  STATUS=$1
  if [ $STATUS -eq 0 ]; then
    blinky sg
  elif [ $STATUS -eq 1 ]; then
    blinky sr
  else
    blinky sw
  fi
};

function pulse {
  blinky p
}

function run {
  pulse
  prove t
  solid $?
}

cd $1
blinky t

run
while inotifywait -qre close_write $@
do
  run
done

