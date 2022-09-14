#!/usr/bin/sh
[[ $1 ]] && __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia mpv -- $1
#--ytdl-raw-options="cookies=~/ytcookies.txt" 
