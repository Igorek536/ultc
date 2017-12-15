#!/bin/bash

echo $$ > /tmp/lab7_6_pid.txt
while [ true ]; do
    echo "$(date '+%Y-%m-%d--%H:%M:%S')  Proc count: $(ps -e | wc -l)" >> /tmp/lab7_6_file.txt
    sleep 60
done
