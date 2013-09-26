#!/bin/bash

touch /tmp/guard_result

./blinky.sh
while inotifywait -qre close_write /tmp/guard_result 
do
    ./blinky.sh
done

