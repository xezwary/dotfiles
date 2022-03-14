#!/bin/sh

[ "$#" -eq 0 ] && exit 1
if [ -n $(command -v curl) ]; then
  url=$(curl -sIL -o /dev/null -w '%{url_effective}' "$1")
else  
  url="$1"
fi
url=$(echo "${url}" | perl -p -e 's/(\?|\&)?utm_[a-z]+=[^\&]+//g;' -e 's/(#|\&)?utm_[a-z]+=[^\&]+//g;')
title="$2"
description="$3"

grep -q "${url}\t${title}\t${description}" /home/haakon/.newsboat/bookmarks.txt || echo -e "${url}\t${title}\t${description}" >> /home/haakon/.newsboat/bookmarks.txt

#xmlstarlet ed -L   -a "//channel/description" -t elem -n item -v ""  \
#     -s "//item[1]" -t elem -n title -v "${title}" \
#     -s "//item[1]" -t elem -n link -v "${url}" \
#     -s "//item[1]/link" -t attr -n "href" -v "${url}" \
#     -s "//item[1]" -t elem -n description -v "${description}" \
#     -d "//item[position()>1000]"  /home/haakon/.newsboat/rss.xml ; 

