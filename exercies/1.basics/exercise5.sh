#! /bin/bash

#Problem statement:
#   Write a shell script that displays "man", "bear", "pig", "dog", "cat", and sheep
# to the screen with each appearing on a separate line.  Try to do this in as few 
# lines as possible. 

animals="man bear pig dog cat sheep"

for animal in animals
do
    echo "${animal}"
done