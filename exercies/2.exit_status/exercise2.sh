#! /bin/bash

#Problem statement:
#         Write a shell script that accepts a file or directory name as an argument.  
# Have the script report if it is a regular file, a directory, or other type of file.  
# If it is a regular file, exit with a 0 exit status. If it is a directory, exit with 
# a 1 exit status.  If it is some other type of file, exit with a 2 exit status. 


FILE=$1

if [ -f $FILE ]
then
    echo "It's a regular file"
    exit 0
elif [ -d $FILE ]
then
    echo "It's a dir"
    exit 1
else
    echo "It's a other type of file"
    exit 2
fi