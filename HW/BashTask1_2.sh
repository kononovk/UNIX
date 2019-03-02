#!/bin/bash

suff=$1
mask=$2
if [ -z "$3" ]
    then temp=${!#}
else
    temp=$PWD
fi
for file in "`find $temp -type f -name '$mask'`"
    do name="$file"
    name1=${name##*.}
    name2=${name%.*}
    if [[ $name1 == $name2 ]]
        then mv "$name" "$name$2"
    else
        mv "$name" "$name2$suff.$name1"
    fi
done
