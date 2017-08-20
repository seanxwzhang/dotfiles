#!/usr/bin/env sh
# Recursively find file/folders and display them
find $PWD -iname "*$1*" -maxdepth 5 | grep -i --color=always $1 | sed -E "s#$PWD#\.#g"
