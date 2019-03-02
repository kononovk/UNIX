#!/bin/bash

function rename {
    name=$1
    name1=${name##*.}
    name2=${name%.*}
    if [[ $name1 == $name ]]
        then echo $name$2
    else
        echo $name2$2"."$name1
    fi
}

if [[ $# -ne 0 ]]
    then
    if [[ $1 == "-d" ]]
        then suff=$2
        shift
        shift
        for arg in "$@"
            do echo $(rename "$arg" $suff)
        done
    else
        suff=$1
        shift
        for arg in "$@"
            do mv "$arg" "$(rename "$arg" $suff)"
        done
    fi
else
    echo "There were no arguments"
fi
