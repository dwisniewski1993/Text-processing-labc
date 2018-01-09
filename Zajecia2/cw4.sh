#!/usr/bin/env bash

#Obliczyć częstość występowania wszystkich sekwencji 3-wyrazowych w pliku korpus.txt (Uwzględnić tylko sekwencje występujące w obrębie pojedynczych linii.)

egrep -o "([^[:punct:][:space:]]+) ([^[:punct:][:space:]]+) ([^[:punct:][:space:]]+)" korpus.txt | sort | uniq -c | sort -k1nr | head

