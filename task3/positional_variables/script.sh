#!/bin/bash


for (( i = 1; i <= $#; i++ )); do
	echo "Arg{$i}: ${!i}"
done

for (( i = 1; i <= $#; i++ )); do
        b=$(( i + 1 ))

	if (( i == $# )); then
		echo "$(( ${!i} + $1 ))"
	else
		echo "$(( ${!i} + ${!b} ))" | tr '\n' ' '
	fi
done
