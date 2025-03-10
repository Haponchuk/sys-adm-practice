if (( $# < 2 )); then
	echo "$1"
elif (( $# > 2 )) && (( $# < 4)); then
	echo "$3"
else 
	echo "Invalid number of arguments"
fi

