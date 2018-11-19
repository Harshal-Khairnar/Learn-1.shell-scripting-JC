#! /bin/bash

# when you found yourself using multiple if elif blocks i.e comparing same variable to diff. values
# it's easier to used case statement for easy read

read -p "Enter y | n : " ANSWER

case $ANSWER in
    [yY]|[yY][eE][sS])           # we can use wildcards as pattern to match
        echo "You entered yes"
        ;;
    [nN]|[nN][oO])
        echo "You entered no"
        ;;
    *)
        echo "Invalid answer"
esac