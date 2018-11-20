#! /bin/bash

# Problem statement:
#   Modify the previous script so that it uses a logging function.Additionally tag each syslog 
# message with "randomly" and include the process ID.  Generate 3 random numbers.

randomNo=$RANDOM

echo "${randomNo}"

logger -t "randomly" -i -p user.info "Random Number : ${randomNo}"