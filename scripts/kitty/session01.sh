#!/bin/sh
kitty @ launch --type tab --tab-title "newsboat" filledprompt "newsboat"
kitty @ launch --type tab --tab-title "music" filledprompt "~/scripts/bash/commands/mpv_music.sh -i ~/Music/playlists/TAM.m3u -s 1 -v 70 -e 2"
kitty @ launch --type tab --tab-title "vimwiki" filledprompt "vim ~/vimwiki/index.wiki"
