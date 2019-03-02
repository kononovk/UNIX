#!/bin/bash
dir_path=~/Документы
file_path=$dir_path/test_file.txt

echo "Creating file $file_path"
touch $file_path
echo "Checking content of $dir_path"
ls $dir_path
