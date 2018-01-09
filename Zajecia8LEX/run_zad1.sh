#!/bin/bash

NAME=`echo ${0} | sed -E 's/[.]\/run_//;s/[.]sh$//'`
NAME_L="${NAME}.l"
NAME_C="${NAME}.lex.yy.c"
NAME_OUT="${NAME}.out"

flex -o "${NAME_C}" "${NAME_L}"
gcc "${NAME_C}" -lfl -o "${NAME_OUT}"