#!/bin/bash
while [ true ]; do
    echo "Введите слово"
    read X
    if [ $X ] && [[ $X == "quit" ]]; then
        break
    fi
done
