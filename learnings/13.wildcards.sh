#! /bin/bash

# wildcards are characters or string used for pattern matching
# Matches 0 or more characters: *
# Matches exactly one characters: ?

# --> Matches all files staring with a having ext .txt
ls a*.txt

# --> Matches all files staring with a and having two letter name
ls a?

# character classes
# Matches any of the characters included between the brackets. Matches exactly one character.
# ex. [aeiou] 
# we can use `!` operator to not match
# ranges in character classes : [a-g], [1-4]

ls c[!aeiou]*.txt


# Named character classes
# => [[:alpha:]]
# => [[:alnum:]]
# => [[:digit:]]
# => [[:lower:]]
# => [[:space:]]
# => [[:upper:]]