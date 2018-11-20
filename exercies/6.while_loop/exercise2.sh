#! /bin/bash

#Problem statement:
#     Write a shell script that asks the user for the number of lines they would 
# like to display from the /etc/passwd file and display those lines.

read -p "How many lines of /etc/passwd would you like to see? " LINES

LINE_NO=1

while [ ${LINE_NO} -le ${LINES} ] && read LINE
do
    echo "${LINE_NO}: ${LINE}"
    ((LINE_NO++))
done < /etc/passwd
