#/bin/bash

#Skrypt kompiluje plik .grm podany jako argument wejściowy

SCRIPT_NAME='draw_thrax'

if [ "$#" -ne 1 ]
then
    echo "Usage: ${SCRIPT_NAME} corrector.fst"
    exit
fi

thraxmakedep $1
make
