#!/usr/bin/env sh
# Recursively find file/folders and display them
find $PWD -maxdepth 5 -iname "*$1*" | grep -i --color=always $1 | sed -E "s#$PWD#\.#g"
