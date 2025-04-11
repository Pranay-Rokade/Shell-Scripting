#!/bin/bash

# This is basics of shell scripting
# The shebang line is used to tell the system which interpreter to use to execute the script

<< comment
Anything 
written 
here will not be executed
comment

name="Pranay"

echo "Name is $name, and date is $(date)"

echo "Enter the name:"

read username

echo "You entered $username"

echo "The characters in $0 are:  $1 $2"
