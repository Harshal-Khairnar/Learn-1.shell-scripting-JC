#! /bin/bash

# Problem statement:
# Write a shell script that displays one random number to the screen and also generates a syslog 
# message with that random number.  Use the "user" facility and the "info" facility for your 
# messages.

randomNo=$(RANDOM)

echo "${randomNo}"

logger -p user.info "Random Number : ${randomNo}"