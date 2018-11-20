#! /bin/bash

#Problem statement:
#       Write a shell script that that allows a user to select an action from the menu.  The actions are to 
# show the disk usage, show the uptime on the system, and show the users that are logged into 
# the system.  Tell the user to enter ​`q` ​to quit.  Display "Goodbye!" just before the script exits. 
 
# If the user enters anything other than ​1,2,3, or q , tell them that it is an "Invalid option." 
 
# You can show the disk usage by using the ​`df​` command.  
# To show the uptime, use the ​`uptime`command.  
# To show the users logged into the system, use the ​`who​`command.
# Print a blank line after the output of each command. 

FLAG=true

while $FLAG
do
    echo "1. Show disk usage."
    echo "2. Show system uptime."
    echo "3. Show the users logged into the system."
    read -p "What would you like to do? (Enter q to quit.) " SELECTION
    
    echo ""
    echo "______________________________________________________"
    case $SELECTION in
        1)
            echo $(df)
        ;;
        2)
            echo $(uptime)
        ;;
        3)
            echo $(who)
        ;;
        q)
            echo "Goodbye!"
            FLAG=false
        ;;
        *)
            echo "Invalid option."
        ;;
    esac
        echo "______________________________________________________"
        echo ""
done