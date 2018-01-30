#!/usr/bin/env bash

#Znaleźć wszystkie palindromy 2-7 literowe występujące w pliku slowa.lst.
#Odpowiedź: 90

grep -E "^(.).?\1$|^(.)(.).?\3\2$|^(.)(.)(.).?\6\5\4$" slowa.lst | wc -l
