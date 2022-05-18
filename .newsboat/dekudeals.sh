#!/bin/bash
target="https://www.dekudeals.com/recent-drops?page_size=all"&&cat <<EOF
<?xmls version="1.0" encoding="UTF-8"?>
<rss version="2.0">

  <channel>
    <title>DekuDeals Recent Price Drops</title>
    <link>$target</link>
    <description>Recently discounted items on the Nintendo eShop</description>

EOF
for i in $(lynx -dump -listonly "$target"|grep items|sed 's|.*items/||');do echo "    <item>"&&echo "      <title>$i</title>"&&echo "      <link>https://www.dekudeals.com/items/$i</link>"&&echo "    </item>";done;echo "  </channel>"&&echo "</rss>"
