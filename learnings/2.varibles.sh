#! /bin/bash

# --> declaring varible
MY_NAME='Harshal'  #There must not be any space before/after =

echo "Welcome to shell scriting, $MY_NAME."

echo "Alternatively variable can be access like : ${MY_NAME}'s shell script"


# --> assigning output of command to a variable

HOSTNAME=$(hostname)  #Maybe find in oldscript :  `hostname`

echo "The hostname is ${HOSTNAME}."

#valid names

# MY_VAR3
# _MY_VAR_3
# myVAR3

#invalid names

# 3MYVAR
# MY_VAR$
# MY-VAR-3