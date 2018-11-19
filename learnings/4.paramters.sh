#! /bin/bash

# postional paramters exists from $0 .. $9
echo "Excecuting script : $0"

# --> read input from user
read -p "Enter Username : " USERNAME 

if [ -e /home/$USERNAME ]
then
    echo "User '${USERNAME}' exists"
else
    echo "User '${USERNAME}' not exist"
fi

# --> accepting all command line arguments
echo "list of all positional arguments : $@"

# in the same way one can pass args to functions as in script