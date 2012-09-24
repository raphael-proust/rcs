#!/bin/sh

DIR="${ARTIST}/${YEAR} ${ALBUM}"

mkdir -p "${DIR}"
cd "${DIR}"

for i in $(seq $NUMTRACK)
do
  mplayer cdda://$i -ao pcm:file=track$i.wav
done

for i in $(seq $NUMTRACK)
do
  flac -8 track$i.wav
done

rm *.wav

cd ../../

