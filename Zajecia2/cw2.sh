#!/usr/bin/env bash

#Znaleźć najczęściej występującą czteroliterową końcówkę wśród słów w pliku slowa.lst. Wynikiem ma być wyłącznie ta końcówka.
#Odpowiedz: ście

egrep -o '[a-z]{4}$' slowa.lst | sort | uniq -c | sort -k1nr | egrep -o ".{4}$" | head -n 1
