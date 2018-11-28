#! /bin/bash

# Problem statement:
# Write a script that renames files based on the file extension.  The script should prompt the user 
# for a file extension.  Next, it should ask the user what prefix to prepend to the file name(s).  By 
# default the prefix should be the current date in YYYY­MM­DD format.  So, if the user simply 
# presses enter the date will be used.  Otherwise, whatever the user entered will be used as the 
# prefix.  Next, it should display the original file name and the new name of the file.  Finally, it 
# should rename the file. 

DATE=$(date "+%F")

read -p "Please enter a file extension: " EXTN

read -p "Please enter a file prefix:  (Press ENTER for ${DATE}) " PREFIX

if [ -z $PREFIX ]
then
    PREFIX=$DATE
else
    PREFIX=$PREFIX
fi

command=$(ls *.${EXTN})

if [ "$?" -eq 0 ]
then
    FILES=$command
    for  FILE in $FILES
    do
        echo "Renaming ${FILE} to ${PREFIX}-${FILE}."
        mv ${FILE} ${PREFIX}-${FILE}
    done
    exit 0
else
    echo "No File Found"
    exit 1
fi