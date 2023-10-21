#!/bin/sh
# * TR_APP_VERSION
# * TR_TIME_LOCALTIME
# * TR_TORRENT_DIR
# * TR_TORRENT_HASH
# * TR_TORRENT_ID
# * TR_TORRENT_NAME
notify-send "> Transmission-daemon" "$TR_TORRENT_NAME has completely downloaded."
transmission-remote -t$TR_TORRENT_ID -S

# Put computer to sleep if no torrents are downloading
#sleep 2 && [[ $(transmission-remote -l | grep -v 'Stopped\|Finished\|ETA\|Sum:' | wc -l) == 0 ]] && systemctl suspend
# Send exit request if no torrents are downloading
#sleep 2 && [[ $(transmission-remote -l | grep -v 'Stopped\|Finished\|ETA\|Sum:' | wc -l) == 0 ]] && transmission-remote --exit
