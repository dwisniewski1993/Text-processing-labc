#/bin/bash

#Skrypt przetwarza automat z postaci binarnej do psotaci tekstowej (plik text.fst) oraz tworzy obrazek automatu (plik binary.ps) z pliku wejsciowego podanego jako argument

SCRIPT_NAME='draw_openfst'

if [ "$#" -ne 1 ]
then
    echo "Usage: ${SCRIPT_NAME} binary.fst"
    exit
fi

fstprint --isymbols=ascii.syms --osymbols=ascii.syms $1 text.fst
fstdraw --isymbols=ascii.syms --osymbols=ascii.syms binary.fst binary.dot
dot -Tps binary.dot > binary.ps
