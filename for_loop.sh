#!/bin/bash

# This is for loop

<< comment
 1. The first argument is a string
 2. The second argument is a start range
 3. The third argument is an end range
 4. The script should print the string and the numbers from start to end range
 5. The script should use a for loop to iterate from start to end range
comment

for (( i=$2 ; i<=$3; i++ ))
do
	echo "$1 $i"
done


