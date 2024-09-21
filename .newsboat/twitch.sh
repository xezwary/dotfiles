#!/bin/sh
cat <<EOF
<?xmls version="1.0" encoding="UTF-8"?>
<rss version="2.0">

  <channel>
    <title>Twitch livestreams</title>
    <link>https://www.twitch.tv</link>
    <description>Channels on Twitch that are live</description>

EOF
for i in pippa tenma kirsche fillian fallenshadow bambihaze ironmouse chromuchromu marimari_en kanekolumi nanobites sena_bonbon sayu liquidwifi;do yt-dlp -q -i -F "https://twitch.tv/$i" >/dev/null 2>&1&&echo -e "    <item>\n      <title>$(date +"%D")$([ "$(date +"%H")" -gt 12 ]&&echo "PM"||echo "AM") - $i is live</title>\n      <description>https://www.twitch.tv/$i/ $(date)</description>\n    </item>"&&sleep 0.$(($RANDOM % 70));done;echo -e "  </channel>\n</rss>"
