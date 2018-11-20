#! /bin/bash

#Problem statement:
#   Write a shell script that consists of a function that display the number of files 
# in the present working directory.  Name this function "file_count" and call it in 
# your script.  If you use a variable in your function, remember to make it a local variable.

file_count(){
    local DIR=$(pwd)
    ls -1 $DIR | wc -l  && return 0 || return 1
}

display(){
    local NoOfFiles=0
    NoOfFiles=$( file_count $DIR )

    echo "No of files in current dir : " 
    echo " $NoOfFiles"

    return 0 
}

display $1
exit 0