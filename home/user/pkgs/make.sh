#!/bin/sh

for i in dwm
do
  cd $i
  makepkg -fic
  cd ..
done
