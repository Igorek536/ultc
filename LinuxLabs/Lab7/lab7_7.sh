#!/bin/bash

if [ "$1" == "start" ]; then
    `./lab7_6.sh` &
    jobs
else
    kill -9 $(cat /tmp/lab7_6_pid.txt)
    killall lab7_7.sh
    rm /tmp/lab7_6_pid.txt
    jobs
fi
