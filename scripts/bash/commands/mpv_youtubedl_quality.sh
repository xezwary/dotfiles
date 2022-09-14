#!/usr/bin/sh
[[ $1 ]] && __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia setsid -f mpv --no-terminal --force-window --quiet -- $1 2>/dev/null >/dev/null 2>&1
#--ytdl-raw-options="cookies=~/ytcookies.txt" 
