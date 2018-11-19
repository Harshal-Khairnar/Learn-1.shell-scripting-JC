#! /bin/bash

NUM=1
# --> iterating no of times 
while [ $NUM -lt 5 ]
do
    echo "Current num: ${NUM}"
    ((NUM++))
done

# --> infinite while loop
# while true
# do
#     echo 'still pinging...'
#     sleep 1
# done