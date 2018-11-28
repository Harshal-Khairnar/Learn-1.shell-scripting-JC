#! /bin/bash

#Problem statement:
#   Write a shell script that prompts the user for a name of a file or directory and reports 
# if it is a regular file, a directory, or other type of file.Also perform an ls command 
# against the file or directory with the long listing option. 


read -p "Enter name of file/directory : " FILE

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