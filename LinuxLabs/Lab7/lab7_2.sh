#!/bin/bash
if [ $1 ] && [ $2 ] && [ ! $3 ]; then
    if [ $1 -gt $2 ]; then
        echo $1
    elif [ $2 -gt $1 ]; then
        echo $2
    fi
else
    echo "Ошибочка вышла..."
fi
