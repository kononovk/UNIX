#/bin/bash

web=`curl https://www.cbr.ru`
patt="Ключевая ставка"
res=${web##*patt}
res=${res#*<td>}
echo ${res:0:4}
