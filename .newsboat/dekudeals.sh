#!/bin/bash
target="https://www.dekudeals.com/recent-drops?page_size=all"&&IFS=$(echo -en "\n\b")&&incnum=7&&temp_file=$(mktemp)&&trap "rm -f $temp_file" 0 2 3 15&&wget -q -O $temp_file $target&&totnum=$(($(grep "<strong>" $temp_file|wc -l)-1))&&cat <<EOF
<?xmls version="1.0" encoding="UTF-8"?>
<rss version="2.0">

  <channel>
    <title>DekuDeals Recent Price Drops</title>
    <link>$target</link>
    <description>Recently discounted items on the Nintendo eShop</description>

EOF
arr=($(grep -E "^[^<;]|<strong>|<small>|<s class='text-muted'>[0-9]*|^<a class='main-link' href='/items/" $temp_file|grep -vE "^Add to|^Get in touch at|^This site uses aff|^As an Amazon Ass|^Nintendo eShop|^[0-9]* items|^Deku Deals is made by |^at$|^ago$|^Other platforms</a></li>$|^Show all$|^At&nbsp;least&nbsp;$|^Show all$|^Sale start time$|^Sort by:$|^Recent Price Drops$|^Collection$|^Wishlist$|^or$|^NO$|^gtag|^function gtag|^<small>Sale ends"|sed -e "s|<strong>||;s|</strong>||;s|<s class='text-muted'>||;s|</s>||;s|<a class='main-link' href='/items/||;s|'>||;s|<small>||;s|</small>||;s|\&|\&\#38\;|"))&&for ((i=2;i<=totnum;i++));do echo -e "    <item>\n      <title>${arr[$incnum]}</title>\n      <link>https://www.dekudeals.com/items/${arr[$(($incnum-1))]}</link>\n      <description>Was ${arr[$(($incnum+1))]}, now ${arr[$(($incnum+2))]}</description>\n    </item>"&&incnum=$(($incnum+5));done;echo -e "  </channel>\n</rss>";rm -f $temp_file
