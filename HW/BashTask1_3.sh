#!/bin/bash

file="/etc/passwd"

if [[ $# -ne 0 ]]; then
    if [[ $1 == "-f" ]]; then
        file=$2
        user=$3
    else
        user=$1
    grep "^$user:"<$file | cut -d ':' -f 6 
    fi
else
    echo "There were no arguments"
fi
