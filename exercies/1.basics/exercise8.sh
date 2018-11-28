#! /bin/bash

#Problem statement:
#   Modify the previous script so that it accepts the file or directory name as 
# an argument instead of prompting the user to enter it. 

FILES=$@
echo ""
for FILE in $FILES
do
    if [ -f $FILE ]
    then
        echo "It's a regular file : ${FILE}"
        ls -l $FILE
    elif [ -d $FILE ]
    then
        echo "It's a dir : ${FILE}"
        ls -l $FILE
    else
        echo "It's a other type of file : ${FILE}"
    fi
    echo "__________"
done