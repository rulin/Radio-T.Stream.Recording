#!/bin/sh
streamURL="http://stream.radio-t.com:8181/stream.m3u"
strTime=`date +%d.%m.%Y_%H.%M.%S`
strDate=`date +%Y.%m.%d`
dirPath=`pwd`"/radio-t/"${strDate}
#fileName="radio-t."${strTime}".mp3"
#fullPath=${dirPath}"/"${fileName}
let "lengthSecond=60*60*12"
timestart=`date +%s`
let "endtime=timestart+lengthSecond"
countProcess=1
streamRipperPath="/usr/bin/streamripper"

mkdir -p ${dirPath}
while [ 1 == 1 ]; do
        currenttime=`date +%s`
        if [[ "$currenttime" -ge "$endtime" ]]
        then
                break
        fi

        currentCountProcess=`ps ax | egrep "[0-9]+:[0-9]+ ${streamRipperPath}" | wc -l`
        if [[ "$currentCountProcess" -lt "$countProcess" ]]
        then
                ${streamRipperPath} ${streamURL} -a -A -s -d ${dirPath} -l ${lengthSecond} --quiet &
        fi
        sleep 10
done