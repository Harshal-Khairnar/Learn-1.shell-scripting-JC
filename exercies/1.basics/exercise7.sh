#! /bin/bash

#Problem statement:
#   Modify the previous script so that it accepts the file or directory name as 
# an argument instead of prompting the user to enter it. 

FILE=$1

if [ -f $FILE ]
then
    echo "It's a regular file"
    ls -l $FILE
elif [ -d $FILE ]
then
    echo "It's a dir"
    ls -l $FILE
else
    echo "It's a other type of file"
fi