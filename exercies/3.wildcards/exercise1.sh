#! /bin/bash

#Problem statement:
# Write a shell script that renames all files in the current directory that end in ".jpg" to begin with 
# today's date in the following format:  YYYY­MM­DD.  For example, if a picture of my cat was in 
# the current directory and today was October 31, 2016 it would change name from "mycat.jpg" to 
# "2016­10­31­mycat.jpg". 
 
# Hint: Look at the format options to the date command. 
 
# For "extra credit" make sure gracefully handle instances where there are no ".jpg" files in the 
# current directory.  (Hint: Man bash and read the section on the nullglob option.) 

command=$(ls *.jpg)

if [ "$?" -eq 0 ]
then
    FILES=$command
    DATE=$(date "+%F")
    for  FILE in $FILES
    do
        mv ${FILE} ${DATE}-${FILE}
    done
    exit 0
else
    echo "No File Found"
    exit 1
fi