#!/bin/bash

NAME="Seldow_Coldwater"
source vars
mkdir $NAME
touch ./$NAME/$FILE
echo "Content in current folder"
ls -l 
echo "Content in $NAME folder"
ls -l ./$NAME
