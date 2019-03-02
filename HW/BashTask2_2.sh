#!/bin/bash

text="Input currency and date (dd/mm/yyyy)"
web="http://www.cbr.ru/scripts/XML_daily.asp?date_req="
if [[ $# -eq 2 ]]; then
        curr=$1
        var=$web$2
        tempfile=`mktemp`
        wget -qO $tempfile $var
        temp="`cat $tempfile`"
        cat $tempfile
        value=${temp##*$curr}
        if [[ $value == $temp ]]; then
                echo $text
        else
                value=${value#*<Value>}
                if [[ -z $value ]]; then
                        echo $text
                else
                        echo ${value:0:7}
                fi
        fi
        rm $tempfile
else
        echo $text
fi

