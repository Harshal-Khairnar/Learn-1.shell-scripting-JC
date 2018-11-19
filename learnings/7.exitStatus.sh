#! /bin/bash

# All command returns some exit status
#
# Exit status ranges 0 - 255
# 0 = success
# other than 0 = error
# we can too exit script with custom exit status's using : ` exit ` command

ping -c 1 gooogle.com

# To check exit status of previous command : $?

echo "exiting with code :  $?"

# We can combine commands with ` && , || , ; `
# &&  --> previous command successed
# ||  --> proceed next command if previous failed
# ;   --> execute all command irrespective of failed/success

