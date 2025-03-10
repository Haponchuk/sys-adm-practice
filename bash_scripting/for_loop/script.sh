#!/bin/bash

args_sum=0
args_average=0

for i in "$@"; do
	(( args_sum += $i ))
done

(( args_average = args_sum/$# ))

echo "sum of arguments: $args_sum"
echo "number of arguments: $#"
echo "average of arguments: $args_average"
