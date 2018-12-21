#!/bin/bash

BASE_PATH="/jiomediasource/jiocinema"
FILE_NO=1
FLAG=true

while read LINE && $FLAG && [ "$FILE_NO" -lt 1573 ]
do
	
	SOURCE=$(echo $LINE | awk -F "," '{print $1}')
	FILE_NAME=$(basename "$SOURCE")
	F1=$(echo $LINE | awk -F "," '{print $2}')
	F2=$(echo $LINE | awk -F "," '{print $3}')
	DEST="$BASE_PATH/$F1/$F2/$FILE_NAME"
	
	echo "======"
	echo $FILE_NO
	echo "======"
	echo -e "source:$SOURCE\ndest:$DEST\nfile name:$FILE_NAME"
	echo "-------------"	
	((FILE_NO++))
	
	echo "checking dir..."
	if [ -e "$BASE_PATH/$F1/$F2" ]; then
		echo "dir '$BASE_PATH/$F1/$F2' exists ~"
		#file can be moved as dest exist
		echo "moving file..."
		mv $SOURCE $DEST
		if [ "$?" -eq 0 ]; then
			echo "STATUS: OK ("$?")"
		else
			echo "STATUS: FAILED ("$?")"
		fi
	else
		echo "dir '$BASE_PATH/$F1/$F2' NOT FOUND"
		echo "making dir..."
		#make dir
		mkdir -p "$BASE_PATH/$F1/$F2" && echo "moving ...." && mv $SOURCE $DEST
		if [ "$?" -eq 0 ]; then
                        echo "STATUS: OK ("$?")"
                else
                        echo "STATUS: FAILED ("$?")"
		fi
	fi	

done < files.log

