#!/bin/bash

#This script will list records from VOD_Vantage folder's

# RECORDS=$(
LINE_NO=1
stat -c "%n | %y" /jiomediadata/kaltura/vod/VOD_Vantage_Watch_Disney/*/* | awk -F "|" '{print $1","$2","NR} END{print "ended"}' | 
while read LINE
do
    SOURCE=$(echo $LINE |  awk  -F "," '{print $1}')
    DATE=$(echo $LINE |  awk  -F "," '{print $2}' | awk -F " " '{print $1}')
    FILE_NO=$(echo $LINE |  awk  -F "," '{print $3}')
    echo "===="
    echo ${LINE_NO}
    echo "===="
    echo -e "source: $SOURCE \ndate: $DATE \nfile_no: $FILE_NO"
    ((LINE_NO++))	
    echo "-------"
done

echo "===>>END<<==="