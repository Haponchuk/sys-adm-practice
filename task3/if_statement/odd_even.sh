myvar="$1"

if (( ${#myvar} % 2 == 0 )); then
	echo "Even"
else
	echo "Odd"
fi 
