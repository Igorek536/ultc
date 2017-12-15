#!/bin/bash
# В качестве аргумента пишем файл

if [ $1 ]; then
    if [ -f "$1" ]; then
        cat $1
    else
        echo "Файл не существует!"
    fi
fi
