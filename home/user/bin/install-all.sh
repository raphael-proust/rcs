#!/bin/sh

if $(ls /bin/dash)
then
  #okay
else
  echo "WARNING: /bin/dash not found. Installed scripts won't work."

for i in $(ls *-bnwr*)
do
  ln -f -s $PWD/$i $HOME/bin/
done
