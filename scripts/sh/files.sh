#!/bin/bash

# Usage:
# ./files.sh [-l] [--location] [-e extension] [--extension extension] [-s] [--stats] [-h] [--help]
# 

function usage() {
	echo "USAGE: $0 [-l] [--location] [-e extension] [--extension extension] [-s] [--stats] [-h] [--help]"
	echo
	echo "examples: "
	echo "$0 -l /etc -e conf -s"
	echo "$0 -e conf --stats"
	exit 1
}

STATS=0
LOCATION_SET=0   #0 -location is not set , use current location  1 -location is set, mention by user
EXT_SET=0

while [ "$#" -gt 0 ] 
do
	
    case "$1" in 
	-l|--location )
		LOCATION=$2
		if ! [ -d $LOCATION ]; then
			usage
		fi
		LOCATION_SET=1
		shift	
		shift
		;;
	-e|--extension )
		EXT=$2
		EXT_SET=1
		shift
		shift
		;;
	-s|--stats )
		STATS=1
		shift
		;;
	-h|--help )
		usage
		;;
	*)
		usage
		;;
    esac
done

if [ "$LOCATION_SET" -ne 1 ]; then
	LOCATION=$(pwd)
fi



if [ "$EXT_SET" -eq 1 ]; then
	ls -l $LOCATION | awk '/^-/' | grep "\.$EXT$" &>/dev/null
	if [ "$?" -ne 0 ];then
		echo "Files with extension '$EXT' in '$LOCATION' not found"
		exit 2
	fi
	ls -l $LOCATION | awk '/^-/' | grep "\.$EXT$" | awk -v stats="$STATS" -f /home/harshal/calUsage.awk
   else
	ls -l $LOCATION | awk '/^-/' | awk -v stats="$STATS" -f /home/harshal/calUsage.awk
			
fi
