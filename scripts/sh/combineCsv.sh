#!/bin/bash

#take list of files as input pattern

PATTERN=$1
COUNT=0


# listing files and displaying content of that file @ STDOUT

ls ${PATTERN} | while read file
do
	if [[ $COUNT -ne 0  ]];then
		cat $file | sed -n '2,$p' && echo
	else
		cat $file && echo
	fi	
	
	((COUNT++))
done 
