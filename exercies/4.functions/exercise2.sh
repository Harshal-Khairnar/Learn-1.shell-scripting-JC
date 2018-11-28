#! /bin/bash

#Problem statement:
# Modify the script from the previous exercise.  Make the "file_count" function accept a directory 
# as an argument.  Next have the function display the name of the directory followed by a colon. 
# Finally, display the number of files to the screen on the next line.  Call the function three times. 
# First, on the "/etc" directory, next on the "/var" directory and finally on the "/usr/bin" directory. 
 
# Example output: 
 
# /etc: 
#       85 

file_count(){
    local DIR=$1
    ls -1 $DIR | wc -l  && return 0 || return 1
}

display(){
    local DIR=$1
    local NoOfFiles=0
    NoOfFiles=$( file_count $DIR )

    echo "${DIR} :"
    echo " $NoOfFiles"

    return 0 
}

display $1
exit 0