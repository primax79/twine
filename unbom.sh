#!/bin/bash
for F in $1
do
  if [[ -f $F && `head -c 3 $F` == $'\xef\xbb\xbf' ]]; then
      # file exists and has UTF-8 BOM
      mv $F $F.bak
      tail -c +4 $F.bak > $F
      echo "removed BOM from $F"
  fi
done
