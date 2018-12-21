#!/bin/bash

#usage: ./spaces.sh  [file-path] [-f | --fix] [-h | --help]

function usage(){
	echo "USAGE: ${0} [file-path] [-f | --fix] [-h | --help]"
	exit 1
}

if [ "$#" -eq 0 ]; then
	usage
fi

FIX=0

while [ "$#" -gt 0 ]
do
    case "$1" in 
	-f|--fix)
		FIX=1
		shift
		;;
	-h|--help)
		usage
		shift
		;;
	*)
	     if [ -f "$1" ]; then
		     FILE=$1
		     shift
		else
		     usage
	     fi
	     ;;
    esac
done

#fixing tab and space issue
if [ "$FIX" -eq 1 ] && [ -e "$FILE" ]; then
	echo "Fixing tab and spaced issue at the beginning and at the end of lines"
	sed -i -e 's/^[[:blank:]]\+//' -e 's/[[:blank:]]\+$//' "$FILE" > /dev/null
fi

#display issue in grahical format
if [ -e "$FILE" ]; then	
	LINES=0
	REGEX_START="^[[:blank:]]+"
	REGEX_END="[[:blank:]]+$"

	while IFS= read -r line
	do
		let LINES++
		#if there is no space issue on the line 
		echo "$line" | sed -e '/[[:blank:]]\+$/q9' -e '/^[[:blank:]]\+/q7' > /dev/null
		if [ $? -eq 0 ]; then
			printf %4s "$LINES:"  >>temp.txt
			echo $line >>temp.txt
			continue
		fi
	
		#print the line no
		printf %4s "$LINES:"  >>temp.txt

		#print the line with space/tab issue at beginning	
		if [[ "$line" =~ $REGEX_START ]]; then
			MATCH=`echo "$BASH_REMATCH" | sed  's/\t/|__TAB__|/g'`
			echo -e -n "\e[41m$MATCH\e[49m" >>temp.txt
		fi

		# print part of line which doen't have space issue at beginning and at end of line		
		echo -e -n "$line" | sed -e 's/^[[:blank:]]\+//' -e 's/[[:blank:]]\+$//' >>temp.txt

		#print the line with space/tab issue at end
		 if [[ "$line" =~ $REGEX_END ]]; then
                        MATCH=`echo "$BASH_REMATCH" | sed  's/\t/|__TAB__|/g'`
                        echo -e "\e[41m$MATCH\e[49m" >>temp.txt
		    else
			echo >>temp.txt
                fi

	done < "$FILE"
	
	cat temp.txt
	rm temp.txt
fi


if [ "$FIX" -eq 1 ];then
	echo ""
	echo -e "\e[42mDONE\e[49m"
fi
