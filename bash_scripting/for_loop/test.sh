#!/bin/bash
args_sum=0

for i in "$@"; do
        (( args_sum += i ))
done

echo "Sum: $args_sum"
