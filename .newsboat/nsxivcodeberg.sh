#!/bin/bash
target="https://codeberg.org/nsxiv/nsxiv/commits/branch/master"&&cat <<EOF
<?xmls version="1.0" encoding="UTF-8"?>
<rss version="2.0">

  <channel>
    <title>Recent Commits to nsxiv:master</title>
    <link>$target</link>
    <description>Recent commits to nsxiv master branch</description>

EOF
for i in $(lynx -dump -listonly "$target"|grep "commit/[a-z0-9]*$"|sed -e "s|^ *[0-9]*\. ||;"|uniq);do echo -e "    <item>\n      <title>$i</title>\n      <link>$i</link>\n    </item>";done;echo -e "  </channel>\n</rss>"
