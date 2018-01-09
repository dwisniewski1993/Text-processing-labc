#/bin/bash

#Skrypt buduje automat do postaci binarnej do pliku binary.fst z pliku wejsciowego podanego jako argument

SCRIPT_NAME='build_openfst'

if [ "$#" -ne 1 ]
then
    echo "Usage: ${SCRIPT_NAME} file.fst"
    exit
fi

fstcompile --isymbols=ascii.syms --osymbols=ascii.syms $1 binary.fst
