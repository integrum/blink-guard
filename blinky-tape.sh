#!/bin/bash

first_line=`head -n 1 /tmp/guard_result`
if [ $first_line == "success" ]; then
  ruby blinky-tape.rb sg
elif [ $first_line == "failed" ]; then
  ruby blinky-tape.rb sr
elif [ $first_line == "pending" ]; then
  ruby blinky-tape.rb sy
else
  ruby blinky-tape.rb sw
fi
