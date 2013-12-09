#!/bin/bash

function blink {
  STATUS=$1
  if [ $STATUS -eq 0 ]; then
    ~/Projects/blinky/blinky-tape-tool.rb sg
  elif [ $STATUS -eq 1 ]; then
    ~/Projects/blinky/blinky-tape-tool.rb sr
  else
    ~/Projects/blinky/blinky-tape-tool.rb sw
  fi
};

function pulse {
  STATUS=$1
  if [ $STATUS -eq 0 ]; then
    pulse_green
  elif [ $STATUS -eq 1 ]; then
    pulse_red
  else
    pulse_white
  fi
}

function pulse_green {
  ~/Projects/blinky/blinky-tape-tool fg
};

function pulse_red {
  ~/Projects/blinky/blinky-tape-tool fr
};

function pulse_white {
  ~/Projects/blinky/blinky-tape-tool fw
};

function run {
  pulse $LAST_RESULT
  prove t
  LAST_RESULT=$?
  blink $LAST_RESULT
}

cd $1
LAST_RESULT=-1

run

while inotifywait -qre close_write $@
do
  run
done

