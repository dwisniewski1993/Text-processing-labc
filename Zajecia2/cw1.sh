#!/usr/bin/env bash

#Policzyć słowa zakończone na '-at' w pliku slowa.lst
#Odpowiedz: 685

egrep 'at$' slowa.lst | wc -l
