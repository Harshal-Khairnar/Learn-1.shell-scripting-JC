#! /bin/bash -xe 

# `-x option` @ shebang represents x-trace is on

# will print command with substitution i.e instead of var it represents it's val
# from command line/ specific snipet use: set -x 
# to turn off use: set +x

TEST_VAR="test"
#set -x
echo "${TEST_VAR}"
#set +x

# `-e option` @ shebang represents stop exec & exit on error of any command

#set -e
DIR="/not/here"
ls "${DIR}"
echo "done"
#set +e

# `-v option` @ shebang will print command before expansion
# set -v
test='JUST TESTING...?'
echo "This is ${test}"
# set +v


#--------------------------OTHER WAYS TO DEBUG--------------------------------
# 1.used syntax highlighting in editor
# 2. use PS4 variable for extra info. default `+`
# 3.File types; use cat -v option , file , dos2unix utility.