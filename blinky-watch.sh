#!/bin/bash

while inotifywait -qre close_write /tmp/guard_result 
do
    ./blinky.sh
done
