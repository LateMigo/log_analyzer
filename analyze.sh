#!/bin/bash
if [ -z "$1" ]; then
 echo "Uzycie $0 plik_logu"
 exit 1
fi

if [ ! -f "$1" ]; then
 echo "Nie ma takiego pliku: $1"
 exit 1
fi

grep "Failed password" "$1" | awk '{print $(NF-2)}' | sort | uniq -c | sort -nr
