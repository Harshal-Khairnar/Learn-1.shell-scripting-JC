#! /bin/bash

#Problem statement:
#     Write a shell script that loops through the /etc/passwd file one line at a time.
# Prepend each line with a line number followed by a colon and then a space. 

LINE_NO=1
while read LINE
do
    echo "${LINE_NO}: ${LINE}"
    ((LINE_NO++))
done < /etc/passwd
