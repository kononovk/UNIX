#!/bin/bash

size=$1
if [ $# -ne 2 ]
    temp="."
else
    temp=$2
fi
for file in ${temp}/*
    do filesize=$(stat -c%s "$file")
    if [ $filesize -gt $size ]
	then echo $file
    fi
done