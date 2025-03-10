#!/bin/bash

while true; 
do
	echo "Enter a command: "
	read command
	
	if [[ $command == ls* ]]; then
		$command

	elif [[ $command == "pwd" ]]; then
		$command

	elif [[ $command == "hi"  ]]; then
		echo "Hello $USER"

	elif [[ $command == "exit" ]]; then
		break
	fi	
done
