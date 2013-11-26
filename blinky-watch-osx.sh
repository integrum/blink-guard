#!/bin/bash

touch /tmp/guard_result

fswatch /tmp ./blinky.sh
