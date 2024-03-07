#!/usr/bin/sh
[[ $1 ]]&&(mpv --no-terminal --force-window --quiet --ytdl-format=best -- $(echo "$1" | sed -e "s|www\.youtube\.com|invidious\.private\.coffee|" -e "s|youtube\.com|invidious\.private\.coffee|") 2>/dev/null >/dev/null 2>&1||notify-send "MPV failed.")
