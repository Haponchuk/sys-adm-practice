#!/bin/bash

echo "Enter a file name:"
read file_name

head -c 4KB /dev/urandom > $file_name
file_size=0


until (( $file_size >= 1024 ))
do
	cp $file_name temp.txt && cat temp.txt >> $file_name && rm temp.txt
	echo "Filesize: $file_size"
	sleep 0.1
	file_size=$(ls -s $file_name | grep -Po '^[^\d]*(\d+)')
done	
