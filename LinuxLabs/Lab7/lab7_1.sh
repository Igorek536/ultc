#!/bin/bash
if [ $1 ] && [ $2 ] && [ $3 ]; then
    echo $(($(($1 + $2)) / $3))
fi
