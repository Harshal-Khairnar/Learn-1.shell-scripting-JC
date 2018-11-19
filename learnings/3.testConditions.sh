#! /bin/bash

USERNAME=$1
# To test condition in shell script : [ condition-to-test ]

# --> if else condition []
if [ -e /home/$USERNAME ]
then
    echo "User '${USERNAME}' exists"
else
    echo "User '${USERNAME}' not exist"
fi

# File Operations
# 
#   -d  File exists and directory
#   -e  File exists
#   -f  File exists and regular file
#   -r  File has readable permissions
#   -w  File has writable permisssions
#   -z  File is not empty
#   -x  File has executable permissions
#
#
# String Operations
#
#    -z   STRING is empty
#    -n   STRING is not empty
#    
#    STRING1 = STRING2
#    STRING1 != STRING2
#
# Arithmatic Operations
#
#   -gt greater than
#   -ge greater than equal to
#   -lt less than
#   -le less than equal to
#   -eq equal to
#   -ne not equal to
#