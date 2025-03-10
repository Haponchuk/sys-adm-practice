# !/bin/bash

echo "Current script name: $0"
echo -e "All arguments: \n$@"
echo -e "All arguments passed to the script: \n$#"
echo "Argument 2: $2, Argument 4: $4"
[[ $1 -eq $2 ]]
echo "exit code of -eq operation on 1st and 2nd arguments: -> $?"
