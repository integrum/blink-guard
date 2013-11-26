#!/bin/bash

INTERVAL=1000

if [ $1 -a $1 == "FAST" ]; then
  INTERVAL=400
fi

function pulse_green {
  blink1-tool --millis $INTERVAL --savepattline 0x00,0xff,0x00,0
  blink1-tool --millis $INTERVAL --savepattline 0x00,0x00,0x00,1
  blink1-tool --play 1
}

function pulse_red {
  blink1-tool --millis $INTERVAL --savepattline 0xff,0x00,0x00,0
  blink1-tool --millis $INTERVAL --savepattline 0x00,0x00,0x00,1
  blink1-tool --play 1
}

function pulse_yellow {
  blink1-tool --millis $INTERVAL --savepattline 0xff,0xcc,0x00,0
  blink1-tool --millis $INTERVAL --savepattline 0x00,0x00,0x00,1
  blink1-tool --play 1
}

function pulse_white {
  blink1-tool --millis $INTERVAL --savepattline 0xff,0xff,0xff,0
  blink1-tool --millis $INTERVAL --savepattline 0x00,0x00,0x00,1
  blink1-tool --play 1
}

first_line=`head -n 1 /tmp/guard_result`
if [ $first_line == "success" ]; then
  pulse_green
elif [ $first_line == "failed" ]; then
  pulse_red
elif [ $first_line == "pending" ]; then
  pulse_yellow
else
  pulse_white
fi
