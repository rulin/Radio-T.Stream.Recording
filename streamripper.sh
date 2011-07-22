#!/bin/sh
streamURL="http://stream.radio-t.com:8181/stream.m3u"
strTime=`date +%d.%m.%Y_%H.%M.%S`
strDate=`date +%d.%m.%Y`
dirPath=`pwd`"/radio-t/"${strDate}
#fileName="radio-t."${strTime}".mp3"
#fullPath=${dirPath}"/"${fileName}
let "lengthSecond=60*60*12"

mkdir -p ${dirPath}
/usr/bin/streamripper ${streamURL} -a -A -s -d ${dirPath} -l ${lengthSecond} --quiet &

