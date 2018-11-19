#! /bin/bash

NUM1=$1
NUM2=$2

# --> if elif else statement

if [ "$NUM1" -gt "$NUM2" ]
then
    echo "${NUM1} is greater than ${NUM2}"
elif [ "$NUM1" -lt "$NUM2" ]
then
    echo "${NUM1} is less than ${NUM2}"
else
    echo "${NUM1} and ${NUM2} are equal"
fi