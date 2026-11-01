#!/bin/bash

./analyze.sh sample.log > wynik.txt

if diff wynik.txt oczekiwane.txt; then
 echo "Wszystko okej (Elegancja Francja)"
else 
 echo 'Blad: Wynik sie nie zgadza :('
 exit 1
fi
