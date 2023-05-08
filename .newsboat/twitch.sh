#!/bin/sh
cat <<EOF
<?xmls version="1.0" encoding="UTF-8"?>
<rss version="2.0">

  <channel>
    <title>Twitch livestreams</title>
    <link>https://www.twitch.tv</link>
    <description>Channels on Twitch that are live</description>

EOF
for i in nanobites_ sayu adumplaze;do yt-dlp -q -i -F "https://twitch.tv/$i" >/dev/null 2>&1&&echo -e "    <item>\n      <title>$(date +"%D") - $i is live</title>\n      <link>https://www.twitch.tv/$i</link>\n    </item>"&&sleep 0.$(($RANDOM % 10));done;echo -e "  </channel>\n</rss>"