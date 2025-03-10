#!/bin/bash

mkdir Name_Surname || { echo "Something went wrong"; exit 1; } \
	&& touch Name_Surname/my_file || echo "Something went wrong" \
	&& echo "Hello Word" > Name_Surname/my_file || echo "Something went wrong" \
	&& cat Name_Surname/my_file || echo "Something went wrong"

