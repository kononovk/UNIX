#!/bin/bash
find $1 -name "*.txt" -print0 | xargs -0 -L1 stat -c"%U %n"
