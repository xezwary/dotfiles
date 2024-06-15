#!/usr/bin/sh
[[ $1 ]]&&(mpv --no-terminal --force-window --quiet --ytdl-format=best -- "$1" >/dev/null 2>&1||notify-send "MPV failed.")
