if [ $1 == $2 ]; then
	echo $?
fi

if [ $1 > $2 ]; then
	echo $?
fi

if [ -n $TEST ]; then
	echo $?
fi

if [ $3 -ne $4 ]; then
        echo $?	
fi

if [ $3 -ge $4 ]; then
	echo $?
fi

echo "[ $1 == $2 ]"
