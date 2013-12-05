#!/bin/bash

first_line=`head -n 1 /tmp/guard_result`
if [ $first_line == "success" ]; then
  ruby blinky-tape.rb pg
elif [ $first_line == "failed" ]; then
  ruby blinky-tape.rb pr
elif [ $first_line == "pending" ]; then
  ruby blinky-tape.rb py
else
  ruby blinky-tape.rb pw
fi
