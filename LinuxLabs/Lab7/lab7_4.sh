#!/bin/bash
# В качестве аргумента пишем файл

FILE="$HOME/.bashrc"
if [ -f "$FILE" ]; then
    ls -al ~ | grep -e ".bashrc"
    cat $FILE | wc -l
else
    echo "Файл не существует!"
fi
