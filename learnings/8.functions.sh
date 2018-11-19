#! /bin/bash

# --> When we need to execute same set commands calling block : functions
# function must be declared before called
hello() {
    local PERSON=$1             # variable can be scoped to function using `local` keyword
    echo "Hello, ${PERSON}"     # one can defined var `local` only in function
    return 0                    # return keyword is used to return exit status for function. {0-255}
}

echo $PERSON  # var `person` is not available here

hello harshal  # passing paramters to functions same as shell script

echo $PERSON    # var `person` is available here if it's defined without `local` in functions

# Tips:
# `$$` --> pid
# `!!` --> to exec previous command
# basename ${file}  --> only name of file 