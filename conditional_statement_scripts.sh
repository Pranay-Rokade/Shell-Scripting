#!/bin/bash

<< disclaimer
This is just for information purpose
This is not a real script
disclaimer

# This is function definition

function is_pass() {
read -p "My Name is: " name
read -p "and my marks is:" marks

if [[ $name == "pranay"  ]];
then
	echo "$name is passed"
elif [[ $marks -ge 100 ]];
then
	echo "$name is passed"
else
	echo "$name is failed"
fi
}

# This is function call
is_pass
