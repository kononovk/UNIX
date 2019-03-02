#!/bin/bash

if [[ $# -eq 3 ]]; then
        web="https://www.asv.org.ru/insurance/insurance_cases/"
        file1=`mktemp`
        wget -qO $file1 $web
        recode cp1251/..utf8 $file1
        str=`grep $1 $file1`
        rm $file1
        for s in $str; do
                num=${s#*insurance_cases/}
                if [[ $num != $s ]]; then
                        num=${num%%/*}
                        name=${s##*>}
			echo $name
                        file2=`mktemp`
                        wget -qO $file2 $web$num
                        recode cp1251/..utf8 $file2
                        date=`grep "О наступлении страхового случая" $file2`
                        date=${date#*>}
                        date=${date%%:*}
                        date=${date//"."/"/"}
                        curr=$(./BashTask2.2 $3 $date)
                        let result=$2*$curr
                        echo $result
                        rm $file2
                fi
        done
else
        echo "Enter the name of the bank, the amount and the currency"
fi