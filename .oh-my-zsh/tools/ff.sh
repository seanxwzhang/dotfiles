#!/usr/bin/env sh
# Recursively find file/folders and display them
find $PWD -name "*" | grep --color=always $1 | sed -E "s#$PWD#\.#g"
