#!/usr/bin/sh
[[ $1 ]]&&echo $1|sed -e "s|www\.youtube\.com|piped\.kavin\.rocks|"|xclip -r -i -selection "clipboard"
