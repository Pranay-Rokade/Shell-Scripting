#!/bin/bash

create_directory() {
	mkdir practice
}

if ! create_directory; then
	echo "The code is being exited as the directory already exists"
	exit 1
fi

echo "this should not work because the code is interrupted"

