#!/usr/bin/sh
[[ $1 ]]&&url=$(echo "$1" | sed -e "s|www\.youtube\.com|yewtu\.be|")&&setsid -f mpv --no-terminal --force-window --quiet --ytdl-format=best -- $url 2>/dev/null >/dev/null 2>&1
