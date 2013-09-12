#!/bin/bash

first_line=`head -n 1 /tmp/guard_result`
if [ $first_line == "success" ]
then
  blink1-tool --green
else
  blink1-tool --red
fi
