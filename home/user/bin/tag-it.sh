#!/bin/sh

for i in $(seq ${TRACKTOTAL})
do
  eyeD3 --artist="${ARTIST}" --album="${ALBUM}" --year="${YEAR}" --track=$i --track-total="${TRACKTOTAL}" track${i}.flac
done


