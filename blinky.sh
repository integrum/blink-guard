#!/bin/bash

first_line=`head -n 1 /tmp/guard_result`
if [ $first_line == "success" ]; then
  blink1-tool --green
elif [ $first_line == "failed" ]; then
  blink1-tool --red
elif [ $first_line == "pending" ]; then
  blink1-tool --rgb 0xff,0xcc,0x00
else
  blink1-tool --white
fi
