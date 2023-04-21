#!/bin/sh
kitty @ launch --type tab --tab-title "newsboat" newsboat
kitty @ launch --type tab --cwd ~/Music/playlists --tab-title "music" filledprompt "~/scripts/bash/commands/mpv_music.sh -s 1 -v 70 -e 2 -i TAM.m3u"
kitty @ launch --type tab --tab-title "vimwiki" vim -c "VimwikiIndex"
kitty @ launch --type tab
