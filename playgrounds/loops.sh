#! /bin/bash

MAX=100;

# --> for loop: looping over range
for i in `seq 1 ${MAX}`
do
    echo "${i}"
done

echo "-----------------------------------------------------------"

# --> for loop: looping no of times
for((i=1;i<=100;i++))
do
    echo "${i}"
done

echo "-----------------------------------------------------------"

COLORS="red green yellow blue"

# --> for loop: looping over list
for COLOR in $COLORS
do
    echo "Color : ${COLOR}"
done