#! /bin/bash

# This script will count the no of files in given dir as argument
# Input: sh functions.sh /etc
# Output:
#       /etc :
#           55

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