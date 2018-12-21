#!/bin/bash

#for color formating output
reset="\e[0m"
bold="\e[1m"
underline="\e[4m"
red="\e[91m"
green="\e[92m"
yellow="\e[93m"
gray="\e[90m"


#unsetting proxy to hit api through curl

http_proxy=""

#To limit the records to be processsed

COUNT=0

BASE_PATH="/jiomediasource/jiocinema"
FILE_NO=1
FLAG=true


function moveFile(){

SOURCE=$1
FILE_NAME=$2
ID=$(echo $FILE_NAME | awk -F "." '{print $1}')
   
BASE_URL="http://10.130.9.92:9091/10.130.9.94/metadata/06758e99be484fca56fb::content"

curl -s -X GET ${BASE_URL}::${ID} > temp.json

F1=$(cat temp.json | jq '.value.folder1')
F2=$(cat temp.json | jq '.value.folder2')

DEST="$BASE_PATH/$F1/$F2/$FILE_NAME"

echo -e "${gray}======${reset}"
echo -e "${bold}$FILE_NO${reset}"
echo -e "${gray}======${reset}"
echo -e "${green}source${reset}: $SOURCE"
echo -e "${red}dest${reset}: $DEST"
echo -e "${yellow}filename${reset}: $FILE_NAME"
echo -e "folder1=> ${bold}${gray}$F1${reset}"
echo -e "folder1=> ${bold}${gray}$F2${reset}"
echo

echo "checking dir..."
	if [ -e "$BASE_PATH/$F1/$F2" ]; then
	    echo "dir '$BASE_PATH/$F1/$F2' exists ~"

	    #file can be moved as dest exist

	    echo "moving file..."
	    mv $SOURCE $DEST
	    if [ "$?" -eq 0 ]; then
	            echo -e "STATUS: ${bold}${green}OK${reset} ("$?")"
	    else
	            echo -e "STATUS: ${bold}${red}FAILED${reset} ("$?")"
	    fi
	else
	    echo "dir '$BASE_PATH/$F1/$F2' NOT FOUND"
	    echo "making dir..."

	    #make dir

	    mkdir -p "$BASE_PATH/$F1/$F2" && echo "moving ...." && mv $SOURCE $DEST
	    if [ "$?" -eq 0 ]; then
	            echo -e "STATUS: ${bold}${green}OK${reset} ("$?")"
	    else
	            echo -e "STATUS: ${bold}${red}FAILED${reset} ("$?")"
	    fi
	fi


rm temp.json

let FILE_NO++

}


#command that stats contents

stat -c "%n | %y" /jiomediadata/kaltura/vod/VOD_Vantage_Watch_Disney/*/* | 
while read LINE && [ "$COUNT" -lt 94 ]
do
        SOURCE=$(echo $LINE | awk -F "|" '{print $1}')
        FILE_NAME=$(basename "$SOURCE")

	#calling function to move one file 
	moveFile $SOURCE $FILE_NAME

	let COUNT++
done
